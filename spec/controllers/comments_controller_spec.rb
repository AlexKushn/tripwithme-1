require 'spec_helper'

describe CommentsController do

  context 'when user logged in' do

    let(:user) { FactoryGirl.create(:user) }
    let(:trip) { FactoryGirl.create(:trip, :users => [user]) }
    subject { FactoryGirl.create(:comment, trip: trip) }
    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'render :index view' do
        get :index, trip_id: trip.id
        expect(response).to render_template :index
      end

      it 'assigns the requested comment to subject' do
        subject { FactoryGirl.create(:comment, trip: trip) }
        get :index, trip_id: trip.id
        expect(assigns(:comments)).to eq([subject])
      end
    end

    describe 'GET #new' do
      it 'assigns the requested comment to new comment' do
        get :new, trip_id: trip.id
        expect(assigns(:comment)).to be_new_record
      end

      it 'renders the :new view' do
        get :new,trip_id: trip.id
        expect(response).to render_template :new
      end

      it 'assigns trip from params' do
        get :new,trip_id: trip.id
        expect(assigns(:trip)).to eq(trip)
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'creates new object' do
          expect {
            post :create, trip_id: trip.id, comment: FactoryGirl.attributes_for(:comment, trip: trip)
          }.to change(Comment, :count).by(1)
        end

        it 'redirects to index path' do
          post :create, trip_id: trip.id, comment: FactoryGirl.attributes_for(:comment)
          expect(response).to redirect_to trip_comments_path(trip.id)
        end
      end

      context 'with not valid attributes' do
        it 'not save object to db' do
          expect {
            post :create, trip_id: trip.id, comment: FactoryGirl.attributes_for(:invalid_comment)
          }.to_not change(Comment, :count)
        end

        it 'render new view' do
          post :create, trip_id: trip.id, comment: FactoryGirl.attributes_for(:invalid_comment)
          expect(response).to render_template :new
        end
      end
    end
  end
end
