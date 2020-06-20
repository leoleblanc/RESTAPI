class AppsController < ApplicationController
  def index
    @apps = App.all
  end

  def create
    @app = App.new(app_params) #grab params

    @app.save
    render :show #render partial on jbuilder to reduce redundancies
  end

  def show # show an individual resource
    @app = App.find(params[:id])
  end

  def update
    @app = App.find(params[:id])
    @app.name = params[:new_name]
    @user.save
  end

  def add_users_for_app
    @added_users = []
    params[:user_ids].each do |user_id|
      @user = User.find(user_id)
      if @user then 
        @market = Market.new
        @market.app_id = params[:id]
        @market.user_id = user_id
        @market.save
        @added_users.push(@user)
      end
    end

    render :add_users
  end

  def show_users_for_app
    @added_users = App.find(params[:id]).users
    render :add_users
  end

  private
  def app_params
    #due to strong params, we need rails to identify these params as ok
    params.require(:app).permit(:name)
    #these params must exist in the request body
  end
end
