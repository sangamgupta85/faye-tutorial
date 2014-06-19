class ChatsController < ApplicationController
  def room
    redirect_to login_path unless session[:username]
  end

  def create
    session[:username] = params[:username]
    render :text => "Welcome #{session[:username]}!"
  end

end
