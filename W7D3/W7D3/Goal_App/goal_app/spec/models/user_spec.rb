require 'rails_helper'

#user should have username, password_digest, session_token. 

RSpec.describe User, type: :model do
  debugger
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  subject(:users) {User.create(username: "pbr", password: "strongpass")}
  
  describe "session token" do
    it "assigns session token if none is given" do
         expect(FactoryBot.build(:user).session_token).to_not be_nil
    end
  end

  describe "Password Encryption" do
      it "does not save password to database" do
          FactoryBot.create(:fattire)
          user = User.find_by(username: 'fattire')
          expect(user.password).to_not be('strongpass')
      end

      it "encrypts password using BCrypt" do
          expect(BCrypt::Password).to receive(:create).with("strongpass")
          FactoryBot.build(:user, password: "strongpass")
      end
  end

end































