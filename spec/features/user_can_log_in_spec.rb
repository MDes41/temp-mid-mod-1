require 'rails_helper'

describe "When I go to the login page" do
  it "I can log in with my credentials" do
    User.create(email_address: 'cdun@utexas.edu', password_digest: 'mystring', password_confirmation: 'mystring')

    visit '/'

    click_on 'Login'

    expect(current_path).to eq(login_path)

    fill_in "Email address", with: 'cdun@utexas.edu'
    fill_in "password", with: 'mystring'
    click_on 'Submit'

    expect(current_path).to eq(links_path)
    expect(page).to have_content('Sign out')
  end
end
