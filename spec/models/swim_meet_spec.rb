require 'rails_helper'

RSpec.describe SwimMeet, type: :model do
  let(:my_meet) { create(:swim_meet) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:date) }

  describe "attributes" do
    it "has name attribute" do
      expect(my_meet).to have_attributes(name: my_meet.name)
    end
    it "has date attribute" do
      expect(my_meet).to have_attributes(date: my_meet.date)
    end
  end
end
