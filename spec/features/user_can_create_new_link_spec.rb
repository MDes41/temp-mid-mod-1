require 'rails_helper'

describe "When I visit the links index page" do
  it "I can create a new link and see all my links" do
    stub_login_user

    fill_in "url", with: 'www.example.com'
    fill_in "title", with: "Texas Fight"
    click_on "Submit Link"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("Link Title is Texas Fight")



  end
end
