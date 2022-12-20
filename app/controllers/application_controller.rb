class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :check , only: [:index]

    def check
        if session[:user_id] == nil
            puts "already log in"
            redirect_to :controller => 'sessions', :action => 'new'
        end
    end




end
