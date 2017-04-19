require 'rails_helper'

RSpec.describe SwimmerDetail, type: :model do
  let(:my_detail) { create(:swimmer_detail) }

  it { should belong_to :user }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:date_of_birth) }

  describe "attributes" do
    it "should have a name attribute" do
      expect(my_detail).to have_attributes(name: my_detail.name)
    end
    it "should have a date of birth" do
      expect(my_detail).to have_attributes(date_of_birth: my_detail.date_of_birth)
    end
    it "should have a gender attribute" do
      expect(my_detail).to have_attributes(gender: my_detail.gender)
    end
  end
end
