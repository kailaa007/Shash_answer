require 'rails_helper'

RSpec.describe Visit, type: :model do
	subject { Visit.new }
	context "evid validation" do
			it "return 'please enter Referrer name in correct format'" do
				subject.evid ="ABC"
				expect(subject).to_not be_valid
				expect(subject.errors.messages).to_not include("please enter Referrer name in correct format")
			end
			it "return 'please enter Referrer name in correct format'" do
				subject.evid ="966634dc-0bf6-1ff7-f4b6-08000c9"
				expect(subject).to_not be_valid
				expect(subject.errors.messages).to_not include("please enter Referrer name in correct format")
			end
	end

	context "evid validation callback" do
		it "should go to callback before create" do
			subject.evid ="evid_966634dc-0bf6-1ff7-f4b6-08000c95c670"
			subject.save
			expect(subject.evid).to match("966634dc-0bf6-1ff7-f4b6-08000c95c670")
		end
	end

	context "association validation" do
		it "should have many page views" do
			view = Visit.reflect_on_association(:page_views)
			expect(view.macro).to eq(:has_many)
		end
	end
end

