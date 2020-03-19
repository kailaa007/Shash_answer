# visit model
class Visit < ApplicationRecord
  has_many :page_views
  alias_attribute :referrerName, :evid
  validates :referrerName, format: { with: /\A[A-z0-9]{8}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{4}-[A-z0-9]{12}\z/i, message: "please enter Referrer name in correct format"}
  alias_attribute :idSite, :vendor_site_id
  alias_attribute :idVisit, :vendor_visit_id
  alias_attribute :visitIp, :visit_ip
  alias_attribute :visitoriId, :vendor_visitor_id

  before_validation :edit_referrer_name

  def edit_referrer_name
    self.referrerName = self.evid.gsub(/(?<=_).*/).first
  end
end
