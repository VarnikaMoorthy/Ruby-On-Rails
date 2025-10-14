class SessionsController < ApplicationController
  def new
  end

  def create
    email = params.dig(:session, :email).to_s.downcase.strip
    password = params.dig(:session, :password).to_s

    users = session[:users] || []
    user = users.find { |u| u['email'] == email }

    if user && user['password'] == password
      session[:current_user_email] = email
      redirect_to root_path, notice: 'Logged in successfully (session)'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:current_user_email)
    redirect_to root_path, notice: 'Logged out'
  end
end
