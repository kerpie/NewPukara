class UserController < ApplicationController
  def index
  	@users = User.all

  	respond_to do |format|
  		format.html
  	end
  end

  def show
  	@user = User.find(params[:id])

  	respond_to do |format|
  		format.html
  	end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def update
    @user = User.find(params[:user_id])
    @user.name = par
    respond_to do |format|
      format.js
    end
  end
end