class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_url, notice:  'Logged in!'
    else
      flash.now.alert = 'Email or password is invalid.'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: 'Logged out!'
  end
end
