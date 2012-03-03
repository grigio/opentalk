# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

# before_filter :require_login, :except => [:not_authenticated]
  
  helper_method :current_users_list
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected
  
  def not_authenticated
    redirect_to root_path, :alert => "Devi prima autenticarti."
  end
  
  def current_users_list
    current_users.map {|u| "#{u.display_name} (#{u.email})"}.join(", ")
  end
  
end
