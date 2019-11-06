require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(
    email: "mlesegret@gmail.com", 
    encrypted_password: "test123", 
    description: "J'aime les fruits en sirop", 
    first_name: "Maxime", 
    last_name: "Le Segretain"
    )
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(
        email: "mlesegret@gmail.com", 
        encrypted_password: "test123", 
        description: "J'aime les fruits en sirop", 
        last_name: "Le Segretain")
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#last_name" do
      it "should not be valid without last_name" do
        bad_user = User.create(email: "mlesegret@gmail.com", 
        encrypted_password: "test123", 
        description: "J'aime les fruits en sirop", 
        first_name: "Maxime")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:last_name)).to eq(true)
      end
    end

  end
end