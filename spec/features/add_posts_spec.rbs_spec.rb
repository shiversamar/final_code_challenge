require 'rails_helper'

RSpec.feature "Adding Post User", type: :feature do
  context "Landing page" do
    Steps "Going to Landing page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Message Board!" do
        expect(page).to have_content("Message Board!")
      end
    end
  end
end
