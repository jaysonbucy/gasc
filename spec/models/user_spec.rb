require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { create(:user) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@gasc.com").for(:email) }

  it { is_expected.to validate_presence_of(:password) }

  describe "attributes" do
    it "should have first_name attribute" do
      expect(subject).to have_attributes(first_name: subject.first_name)
    end
    it "should have last_name attribute" do
      expect(subject).to have_attributes(last_name: subject.last_name)
    end
    it "should have email attribute" do
      expect(subject).to have_attributes(email: subject.email)
    end
    it "should have role attribute" do
      expect(subject).to have_attributes(role: subject.role)
    end
  end

  describe ".from_omniauth" do
    it "returns the user when one already exists" do
      auth = double(provider: subject.provider, uid: subject.uid)
      expect(User.from_omniauth(auth)).to eq(subject)
    end

    it "creates a new user when one does not exist" do
      auth = double(provider: "Google",
                    uid: SecureRandom.uuid,
                    info: double(
                      first_name: "Tester",
                      last_name: "McTesterson",
                      email: "tester@test.me",
                      image: "image"))
      user = User.from_omniauth(auth)
      expect(user.provider).to eq(auth.provider)
      expect(user.uid).to eq(auth.uid)
      expect(user.first_name).to eq(auth.info.first_name)
      expect(user.last_name).to eq(auth.info.last_name)
      expect(user.email).to eq(auth.info.email)
      expect(user.image).to eq(auth.info.image)
    end
  end
end
