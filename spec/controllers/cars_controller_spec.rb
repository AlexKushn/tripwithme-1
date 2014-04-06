require 'spec_helper'

describe CarsController do


  context "when user not logged in" do
    describe "GET #index" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to root_path
      end
    end
  end

  context "when user logged in" do
    let(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:car, driver: user) }

    before do
      sign_in user
    end

    describe "GET index" do
      it "render :index vew" do
        get :index
        expect(response).to render_template :index
      end

      it "assigns the requested car to subject" do
        get :index
        expect(assigns(:cars)).should eq([subject])
      end
    end

    describe "GET #show" do
      it "assigns the requested car to subject" do
        get :show, id: subject
        expect(assigns(:car)).to eq(subject)
      end

      it "renders the :show view" do
        get :show, id: subject
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns the requested car to new car" do
        get :new
        expect(assigns(:car)).to be_new_record
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
        it "creates new object" do
          expect{
            post :create, car: FactoryGirl.attributes_for(:car)
          }.to change(car, :count).by(1)
        end

        it "rendirects to index path" do
          post :create, car: FactoryGirl.attributes_for(:car)
          expect(response).to redirect_to cars_path
        end
      end

      context "with not valid attributes" do
        it "not save object to db" do
          expect{
            post :create, car: FactoryGirl.attributes_for(:invalid_car)
          }.to_not change(car, :count)
        end

        it "render new view" do
          post :create, car: FactoryGirl.attributes_for(:invalid_car)
          expect(response).to render_template :new
        end
      end
    end

    describe "PATCH #update" do
      context "with valid attributes" do
        it "updates object" do
          expect{
            patch :update, id: subject, car: { name: 'new_car' }
          }.to change{ subject.reload.name }.to('new_car')
        end

        it "rendirects to index path" do
          patch :update, id: subject, car: { name: 'new_car' }
          expect(response).to redirect_to cars_path
        end
      end

      context "with not valid attributes" do
        it "not save object to db" do
          expect{
            patch :update, id: subject, car: FactoryGirl.attributes_for(:invalid_car)
          }.to_not change{ subject.name }
        end

        it "render edit view" do
          post :update, id: subject, car: FactoryGirl.attributes_for(:invalid_car)
          expect(response).to render_template :edit
        end
      end
    end

    describe "GET #edit" do
      it "assigns the requested car to subject" do
        get :edit, id: subject
        expect(assigns(:car)).to eq(subject)
      end

      it "renders the :edit view" do
        get :edit, id: subject
        expect(response).to render_template :edit
      end
    end

    describe 'DELETE #destroy' do
      before(:each) { @car = FactoryGirl.create :car, driver: user }

      it "deletes the car" do
        expect {
          delete :destroy, id: @car
        }.to change(car, :count).by(-1)
      end

      it "redirects to cars#index" do
        delete :destroy, id: @car
        expect(response).to redirect_to cars_path
      end
    end
  end
end
   

 
