require 'rails_helper'

RSpec.describe SwimForm, type: :model do
  let(:my_swim_form) { create(:swim_form) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:url) }

  it { should belong_to(:user) }

  describe "attributes" do
    it "should have a description" do
      expect(my_swim_form).to have_attributes(description: my_swim_form.description)
    end
    it "should have a url" do
      expect(my_swim_form).to have_attributes(url: my_swim_form.url)
    end
    it "should have a active boolean" do
      expect(my_swim_form).to have_attributes(active: my_swim_form.active)
    end
  end
end
