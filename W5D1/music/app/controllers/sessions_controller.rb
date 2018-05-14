class SessionsController < ApplicationController

  def new
    # we make this so we have something to save into i guess?
    @user = User.new
    # this is our landing page for login, so let's call it login
    render :login
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = []
      flash[:errors] << "Invalid username and password combination"
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
