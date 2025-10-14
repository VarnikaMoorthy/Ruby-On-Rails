class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # store users as an array of hashes in session[:users]
    session[:users] ||= []

    @user = user_params.to_h

    # basic validations without DB / ActiveModel
    errors = []
    errors << "Name can't be blank" if @user['name'].to_s.strip.empty?
    email = @user['email'].to_s.downcase.strip
    errors << "Email can't be blank" if email.empty?
    # check uniqueness within session
    if session[:users].any? { |u| u['email'] == email }
      errors << 'Email has already been taken'
    end

    password = @user['password'].to_s
    password_confirmation = @user['password_confirmation'].to_s
    if password.length < 6
      errors << 'Password is too short (minimum is 6 characters)'
    end
    if password != password_confirmation
      errors << "Password confirmation doesn't match Password"
    end

    if errors.empty?
      # store minimal user info; DO NOT store raw password in production
      session[:users] << { 'name' => @user['name'], 'email' => email, 'password' => password }
  # Do not auto-login after signup; send user to the login page
  redirect_to login_path
    else
      flash.now[:alert] = errors.join(', ')
      @user = User.new(name: @user['name'], email: @user['email'])
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
