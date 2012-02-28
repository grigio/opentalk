# -*- encoding : utf-8 -*-
class Page < ActiveRecord::Base
  after_initialize :default_values

  def to_param
    title ||= I18n.t('page.new')
    "#{id}-#{title.parameterize}"
  end

  private
  def default_values
    # 'hidden visible confirmed closed'
    self.position ||= 50
    self.status ||= 'visible'
  end

end
