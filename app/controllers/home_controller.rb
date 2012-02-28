# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  def index
  end

  def secret
    render :text => 'secret'
  end
end
