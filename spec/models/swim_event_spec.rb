require 'rails_helper'

RSpec.describe SwimEvent, type: :model do
  let(:my_swim_event) { create(:swim_event) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:distance_in_meters) }
  it { is_expected.to validate_presence_of(:age_group_start) }
  it { is_expected.to validate_presence_of(:age_group_end) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(my_swim_event).to have_attributes(name: my_swim_event.name)
    end
    it "should have a distance_in_meters attribute" do
      expect(my_swim_event).to have_attributes(distance_in_meters: my_swim_event.distance_in_meters)
    end
    it "should have age group attributes" do
      expect(my_swim_event).to have_attributes(age_group_start: my_swim_event.age_group_start)
      expect(my_swim_event).to have_attributes(age_group_end: my_swim_event.age_group_end)
    end
    it "should have gender attribute" do
      expect(my_swim_event).to have_attributes(gender: my_swim_event.gender)
    end
  end
end
