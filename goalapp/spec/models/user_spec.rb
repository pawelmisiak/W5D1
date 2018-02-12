require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of :username }
  it { should validate_presence_of :password_digest }
  it { should validate_presence_of :session_token }
  
  it { should validate_length_of(:password).is_at_least(6) }
  
  # it { should have_many(:goals).class(Goal) }
  
  describe '::find_by_credentials' do
    let!(:user) do
      create(:user, username: 'good_user', password: 'good_password')
    end
    it 'given a username and password, it finds a user' do
      expect(User.find_by_credentials('good_user', 'good_password')).to eq(user)
    end
  end
  
end