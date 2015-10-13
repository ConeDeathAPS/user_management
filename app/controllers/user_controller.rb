class UserController < ApplicationController
  def index
  	@users = User.all
  	render 'index'
  end

  def new
  	render 'new'
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to '/users'
  end

  def show
  	@user = User.find(params[:id])
  	render 'show'
  end

  def create
  	@user = User.create(user_params)
  	if (@user.errors.any?) then
  		@errors = @user.errors.full_messages
  		render 'new'
  	else 
	  	redirect_to '/users'
	  end
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	redirect_to '/'
  end

  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password)
  	end
end
