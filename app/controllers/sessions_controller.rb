class SessionsController < ApplicationController
  before_action :current_user, only: [:check]

  def new
  end

  def check
    if current_user
      redirect_to clubs_path
    elsif current_club
      redirect_to current_club
    else
      redirect_to new_user_path
    end
  end

  def create
    @user = User.find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      if @user && @user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:user_id] = @user.id
        redirect_to clubs_path
      else
      # If user's login doesn't work, send them back to the login form.

        redirect_to '/login'
        flash.now[:error] = "Sessions#create else statement"
      end
  end

  def destroy
    session[:club_id] = nil
    session[:user_id] = nil
    redirect_to '/login'
  end

  #######------------- Club -------------##############

  def new_club
  end

  def check_club
    if @current_club
      redirect_to club_path
    else
      redirect_to new_user_path #double check this is needed/works
    end
  end


  def create_club
   @club = Club.find_by(club_email: params[:club_email])
     # If the club exists AND the password entered is correct.
     if @club && @club.authenticate(params[:password])
       # Save the club id inside the browser cookie. This is how we keep the club
       # logged in when they navigate around our website.
       session[:club_id] = @club.id
       redirect_to club_path(@club) #check this works
     else
     # If club's login doesn't work, send them back to the login form.
       redirect_to '/', notice: 'Else Statements'
     end
 end

  # def destroy_club
  #   session[:club_id] = nil
  #   redirect_to '/login'
  # end
end
