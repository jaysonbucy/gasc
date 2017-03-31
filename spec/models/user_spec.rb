require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { create(:user) }

  it { is_expected.to validate_presence_of(:firstname) }
  it { is_expected.to validate_presence_of(:lastname) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@blocipedia.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "should have firstname attribute" do
      expect(subject).to have_attributes(firstname: subject.firstname)
    end
    it "should have lastname attribute" do
      expect(subject).to have_attributes(lastname: subject.lastname)
    end
    it "should have email attribute" do
      expect(subject).to have_attributes(email: subject.email)
    end
  end

end
