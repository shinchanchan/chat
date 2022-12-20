class SessionsController < ApplicationController

def new
    if request.get?
        session[:user_id] = nil
        session[:username] = nil
        login_check=nil
        render layout: false #layout not worked
       elsif request.post?
         p params[:Username]
         p  params[:password]
         user = User.find_by(username: params[:Username])
         if user != nil && user.password_digest == params[:password]
              puts "sucess login"
              session[:user_id] = user.id
              session[:username]=User.find_by(id: session[:user_id]).username
            @check = 1
            flash[:success] = "Valid Login"
            User.where(:id => session[:user_id] ).update(:active => true).first
           redirect_to :controller => 'chatroom', :action => 'index'
         else
              puts "invalid login"
              flash.now[:error] = "Invalid Login"
            session[:user_id] = nil
        session[:username] = nil
            login_check=nil
            puts "invalid user"
            @check = 2
            redirect_to :controller => 'sessions', :action => 'new'

         end
    end
end

def signup

end


def logout
    User.where(:id => session[:user_id] ).update(:active => false).first
    session[:user_id] = nil
    session[:username] = nil
    login_check=nil
    flash[:success] = "Successfully Logout"
    redirect_to :controller => 'sessions', :action => 'new'
end





end
