require 'net/http'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  # called before controller actions to authenticate user via Facebook login API
  # do nothing if @current_user exists in session
  # if this is first user login => stores user record in database, and asks Facebook for user's name, email
  def authenticate_fb
    puts "** authenticate_fb session=#{session} : fb_user_id=#{session[:fb_user_id]} : @current_user=#{@current_user} : current_user=#{current_user}"

    # do nothing if @current_user exists in session
    return if current_user

    # obtain Facebook code from params after Facebook login, or from session for already logged in user
    session[:fb_code] = params[:code] || session[:fb_code]

    # obtain a valid Facebook access token
    uri = URI('https://graph.facebook.com/v2.6/oauth/access_token?')
    fb_params = { :client_id => '1812832325605603',
                  :redirect_uri => URI::encode("#{request.base_url}/slots"),
                  :client_secret => '69d32dbd464203eb287eafb29cc6aa69',
                  :code => session[:fb_code],
                  :scope => 'email',
                  :fields => 'name, email' }
    uri.query = URI.encode_www_form(fb_params)
    res = Net::HTTP.get_response(uri)
    res_json = JSON.parse(res.body)

    # renew access token
    session[:access_token] = res_json['access_token']
    # update fb_params to make further FB Graph requests
    fb_params[:access_token] = res_json['access_token']

    # retrieve user details with name and email
    uri = URI('https://graph.facebook.com/v2.8/me')
    uri.query = URI.encode_www_form(fb_params)
    res = Net::HTTP.get_response(uri)
    res_json = JSON.parse(res.body)

    # store fb_user_id into session
    session[:fb_user_id] = res_json['id']

    puts "** res_json=#{res_json}"
    # Facebook login failed, redirect to root and display error message
    unless res.is_a?(Net::HTTPSuccess)
      flash[:error] = 'Please login to facebook before proceeding to home page.'
      Rails.logger.info "** nullifying user!!"
      nullify_current_user
      redirect_to root_url and return
    end

    # Facebook login succeed
    # user exists before?
    user = User.find_by(fb_user_id: session[:fb_user_id])

    # sign up a new user
    unless user
      Rails.logger.info "** creating a new user #{res_json}"
      user = User.create(fb_user_id: session[:fb_user_id], email: res_json['email'], name: res_json['name'])
      flash[:message] = "Welcome to I Got Talent #{user.name}!"
    end

    set_current_user(user.id)
  end

end
