require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_current_user(user_id)
    session[:user_id] = user_id
  end

  def nullify_current_user
    set_current_user(nil)
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_fb
    unless current_user
      # find FB user
      session[:fb_code] = params[:code] || session[:fb_code]
      fb_code = session[:fb_code]
      session[:fb_user_id] = params[:fb_user_id] || session[:fb_user_id]
      session[:fb_user_email] = params[:fb_user_email] || session[:fb_user_email]
      fb_user_id = session[:fb_user_id]
      uri = URI('https://graph.facebook.com/v2.6/oauth/access_token?')
      params = { :client_id => '1812832325605603',
                 :redirect_uri => URI::encode('http://localhost:3000/slots'),
                 :client_secret => '69d32dbd464203eb287eafb29cc6aa69',
                 :code => fb_code,
                 :scope => 'email' }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      # debugger

      # Facebook login failed
      unless res.is_a?(Net::HTTPSuccess)
        flash[:error] = 'Please login to facebook before proceeding to home page.'
        redirect_to root_url
      # Facebook login succeed => login user or create a new one
      else
        # find if user exists
        user = User.find_by(fb_user_id: fb_user_id)

        # sign up new user
        unless user
          user = User.create(fb_user_id: fb_user_id)
          flash[:message] = 'Welcome to I Got Talent!'
        end
        set_current_user(user.id)
      end
    end
  end
end
