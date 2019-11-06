require 'rails_helper'

RSpec.describe Attendance, type: :model do

  before(:each) do 
    @user = User.create(
    id:1,
    email: "mlesegret@gmail.com", 
    encrypted_password: "test123", 
    description: "J'aime les fruits en sirop", 
    first_name: "Maxime", 
    last_name: "Le Segretain"
    ),
    @event = Event.create(
    id: 5,
    start_date: "23-05-2019",
    duration: 30,
    title: "Ici c'est Paris",
    description: "Et la-bas c'est Melun",
    price: 489,
    location: "Paris/Melun",
    admin_id: 1
    ),
    @attendance = Attendance.create(
      id: 1,
      stripe_customer_id: 238,
      guest_id: 1,
      event_id: 5
    )
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end
  end

  describe "#stripe_customer_id" do
      it "should not be valid without stripe_customer_id" do
        bad_user = Attendance.create(
          id: 1,
          guest_id: 1,
          event_id: 1
        )
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:stripe_customer_id)).to eq(true)
      end
    end

    describe "#guest_id" do
      it "should not be valid without guest_id" do
        bad_user = Attendance.create(
        id: 1,
        stripe_customer_id: 238,
        event_id: 5
      )
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:guest_id)).to eq(true)
      end
    end


    describe "#event_id" do
      it "should not be valid without event_id" do
        bad_user = Attendance.create(
        id: 1,
        stripe_customer_id: 238,
        guest_id: 1
      )
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:event_id)).to eq(true)
      end
    end

end