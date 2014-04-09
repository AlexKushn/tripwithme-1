class WelcomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :help, :about, :contact]
  def index
  end

  def help
  end

  def about
  end

  def contact
  end
end
