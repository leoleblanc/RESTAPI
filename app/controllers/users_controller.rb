class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params) #grab params

    @user.save
    render :show #render partial on jbuilder to reduce redundancies
  end

  def show # show an individual resource
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) # this param is inside of the url itself
    @user.name = params[:new_name] # this param is inside of the request body
    @user.save
  end

  def add_tools
    @created_tools = []
    params[:tools].each do |tool|
      @tool = Tool.new
      @tool.name = tool
      @tool.user_id = params[:id]
      @tool.save
      @created_tools.push(@tool)
    end
  end

  def get_tools
    @created_tools = User.find(params[:id]).tools
    render :add_tools
  end

  def add_apps_for_user
    @added_apps = []
    params[:app_ids].each do |app_id|
      @app = App.find(app_id)
      if @app then 
        # create the market table relation; this will tie the app to the user (user.app will return this app)
        @market = Market.new
        @market.user_id = params[:id]
        @market.app_id = app_id
        @market.save
        @added_apps.push(@app)
      end
    end

    render :add_apps
  end

  def show_apps_for_user
    @added_apps = User.find(params[:id]).apps
    render :add_apps
  end

  private
  def user_params
    #due to strong params, we need rails to identify these params as ok
    params.require(:user).permit(:name, :technical, :tagline)
    #these params must exist in the request body
  end

  #user/:id/tools POST to add tools for user
  #user/:id/tools GET to show the tools available for certain user

end
