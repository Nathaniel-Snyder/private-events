class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in(@user)			
			redirect_to current_user
		else
			flash.now[:error] = "Username Taken"
			render :new
		end
	end

	def index
		@users = User.all
	end

	def show
		@user= User.find(params[:id])
		@events = @user.events
	end

	private

	def user_params
		params.require(:user).permit(:name)
	end
end
