require 'rails_helper'

RSpec.describe Event, type: :model do

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
    start_date: "23-05-2019",
    duration: 30,
    title: "Ici c'est Paris",
    description: "Et la-bas c'est Melun",
    price: 489,
    location: "Paris/Melun",
    admin_id: 1
    )
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end
  end

  describe "#description" do
      it "should not be valid without description" do
        bad_user = Event.create(
          start_date: "23-05-2019",
          duration: 30,
          title: "Ici c'est Paris",
          price: 489,
          location: "Paris/Melun",
          admin_id: 1
          )
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:description)).to eq(true)
      end
    end

    describe "#title" do
      it "should not be valid without title" do
        bad_user = Event.create(
          start_date: "23-05-2019",
          duration: 30,
          description: "Et la-bas c'est Melun",
          price: 489,
          location: "Paris/Melun",
          admin_id: 1
          )
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:title)).to eq(true)
      end
    end

end