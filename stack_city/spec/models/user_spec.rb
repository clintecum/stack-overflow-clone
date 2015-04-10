require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:chad) {User.create!(username:   "IamChad",
                            email:      "chadmail@chad.com",
                            password:   "1234",
                            location:   "Mississippi",
                            first_name: "Chad",
                            last_name:  "Dwyane",
                            avatar:     "http://i.imgur.com/VlflUyi.jpg")}

  let!(:murphy) {User.create!(username:   "IamMurphy",
                              email:      "murphy@murphy.com",
                              password:   "1234",
                              location:   "Louisiana",
                              first_name: "Murphy",
                              last_name:  "Dwyane",
                              avatar:     "https://itsrockingwrestling.files.wordpress.com/2011/05/the-rock1.jpg")}

  let!(:dwyane) {User.create!(username:   "IamDwyane",
                              email:      "myemail@gmail.com",
                              password:   "1234",
                              location:   "Georgia",
                              first_name: "Dwyane",
                              last_name:  "Dwyane",
                              avatar:     "http://upload.wikimedia.org/wikipedia/commons/e/e2/Intercontinental_Champion_THE_ROCK.jpg" )}


  describe "validations" do
    it "should" do
    end
  end

end
