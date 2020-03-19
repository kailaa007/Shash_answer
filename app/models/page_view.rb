class PageView < ApplicationRecord
	belongs_to :visit
  
  default_scope { order(timestamp: :asc) }
  alias_attribute :pageTitle, :title
  alias_attribute :timeSpent, :time_spent
  before_create :set_position

  private

  def set_position
  	pos = self.visit.page_views.all.map{|x| x.position.to_i}.max
  	self.position = pos.nil? ? 1 : pos + 1
  end
end
