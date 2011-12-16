class Page < ActiveRecord::Base
  def to_param
    title ||= I18n.t('page.new')
    "#{id}-#{title.parameterize}"
  end
end
