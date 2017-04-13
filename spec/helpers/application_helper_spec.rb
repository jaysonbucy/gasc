require 'rails_helper'

RSpec.describe ApplicationHelper do
  helper ApplicationHelper

  let(:subject) { create(:user) }

  describe "#def avatar_url" do
    it "returns a gravatar url with the users email" do
      expectedGravatarID = Digest::MD5.hexdigest(subject.email.downcase)
      expectedURL = "http://gravatar.com/avatar/#{expectedGravatarID}.png?s=80"
      expect(avatar_url(subject)).to eq(expectedURL)
    end

    it "returns the correct hexdigest" do
      expect(Digest::MD5).to receive(:hexdigest).with(subject.email.downcase)
      avatar_url(subject)
    end
  end
end
