# -*- encoding : utf-8 -*-
module ApplicationHelper
  def profile_img(user)
    if user.providers[0].provider == "twitter"
      "http://api.twitter.com/1/users/profile_image/#{ user.email }.png"
    elsif user.providers[0].provider == "facebook"
      "https://graph.facebook.com/#{ user.providers[0].uid }/picture"
    end
  end

  def profile_url(user)
    
  end

  def title(something = nil)
  	@title ||= something
  	@title
  end
  
end
