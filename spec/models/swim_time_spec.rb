require 'rails_helper'

RSpec.describe SwimTime, type: :model do
  let(:my_time) { create(:swim_time) }

  it { is_expected.to validate_presence_of(:time_in_seconds) }
  
  it { should belong_to :event_heat }
  it { should belong_to :swimmer_detail }

  describe "attributes" do
    it "has time in seconds" do
      expect(my_time).to have_attributes(time_in_seconds: my_time.time_in_seconds)
    end
  end
end
