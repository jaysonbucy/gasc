require 'rails_helper'

RSpec.describe Form, type: :model do
  let(:my_form) { create(:form) }

  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:created_by) }

  describe "attributes" do
    it "should have a description" do
      expect(my_form).to have_attributes(description: my_form.description)
    end
    it "should have a url" do
      expect(my_form).to have_attributes(url: my_form.url)
    end
    it "should have a active boolean" do
      expect(my_form).to have_attributes(active: my_form.active)
    end
    it "should have a created_by name" do
      expect(my_form).to have_attributes(created_by: my_form.created_by)
    end
  end
end
