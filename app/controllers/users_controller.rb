class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(user_params)
		if @new_user.save
			redirect_to users_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to users_path
		else
			render :edit
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			redirect_to users_path
		else
			render :back
		end
	end

	private

	def user_params
		params.require(:user).permit!
	end
end