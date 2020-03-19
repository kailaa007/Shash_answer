require 'rails_helper'

RSpec.describe PageView, type: :model do
	subject { Visit.create(evid: 'evid_966634dc-0bf6-1ff7-f4b6-08000c95c670').page_views.new }
 	context "association validation" do
		it "should belongs to visits" do
			visit = PageView.reflect_on_association(:visit)
			expect(visit.macro).to eq(:belongs_to)
		end
	end

	context "default scope test" do
		it "sort pageview by timestamp" do
			expect(PageView.all.to_sql).to eq PageView.all.order(timestamp: :asc).to_sql
		end
	end

	context "position callback" do
		it "should go to callback before create" do
			subject.position ="1"
			subject.send(:set_position)
			subject.save
			expect(subject.position).to match("1")
		end
	end
end


 