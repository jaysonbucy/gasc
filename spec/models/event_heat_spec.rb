require 'rails_helper'

RSpec.describe EventHeat, type: :model do
  let(:my_event_heat) { create(:event_heat) }
  
  it { should belong_to(:swim_event) }
  it { should belong_to(:swim_meet) }
end
