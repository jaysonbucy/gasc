require 'rails_helper'

RSpec.describe EventHeat, type: :model do
  let(:my_event_heat) { create(:event_heat) }

  it { should belong_to(:swim_event) }
  it { should belong_to(:swim_meet) }

  describe "attributes" do
    it "should have a heat number attribute" do
      expect(my_event_heat).to have_attributes(heat_number: my_event_heat.heat_number)
    end
  end
end
