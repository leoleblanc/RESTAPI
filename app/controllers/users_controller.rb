class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params) #grab params

    @user.save
  end

  def show # show an individual resource
    @user = User.find(params[:id])
  end

  def update # PATCH will update existing... PUT will replace
    @user = User.find(params[:id])
    @user.name = params[:new_name]
    @user.save
  end


  private
  def user_params
    #due to strong params, we need rails to identify these params as ok
    params.require(:user).permit(:name, :technical)
    #these params must exist in the request body
  end

end
