# -*- encoding : utf-8 -*-
Rails.application.config.sorcery.submodules = [:user_activation, :remember_me, :session_timeout, :activity_logging, :external]

Rails.application.config.sorcery.configure do |config|
  
  #config.session_timeout = 10.minutes
  #config.session_timeout_from_last_action = false
  
#  config.controller_to_realm_map = {"application" => "Application", "users" => "Users"}
  
  config.external_providers = [:twitter, :facebook]

  config.twitter.key = Configs.twitter.key
  config.twitter.secret = Configs.twitter.secret
  config.twitter.callback_url = "#{Configs.site_url}/oauth/callback?provider=twitter"
  config.twitter.user_info_mapping = {:display_name => "name", :email => 'screen_name', :location => 'location', :website => 'url'}
  
  config.facebook.key = Configs.facebook.key
  config.facebook.secret = Configs.facebook.secret
  config.facebook.callback_url = "#{Configs.site_url}/oauth/callback?provider=facebook"
  config.facebook.user_info_mapping = {:display_name => "name", :email => 'email', :location =>'location/name', :website => 'website'}
  
  config.user_config do |user|
    user.username_attribute_names                      = [:email]
    user.subclasses_inherit_config                    = true

    user.user_activation_mailer                       = UserMailer
    user.activation_token_attribute_name              = :activation_code
    user.activation_token_expires_at_attribute_name   = :activation_code_expires_at

#    user.reset_password_mailer                        = UserMailer
#    user.reset_password_expiration_period             = 10.minutes
#    user.reset_password_time_between_emails           = nil

#    user.activity_timeout                             = 1.minutes

#    user.consecutive_login_retries_amount_limit       = 10
#    user.login_lock_time_period                       = 2.minutes

    user.authentications_class                        = UserProvider
  end
  
  config.user_class = User
end
