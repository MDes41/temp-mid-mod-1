require 'rails_helper'

describe "When a guest visits /" do
  it "they can sign up for an account" do
    visit "/"

    click_on 'Sign-up'

    expect(current_path).to eq(new_user_path)

    fill_in "Email address", with: 'cdun@utexas.edu'
    fill_in "Password", with: 'texas'
    fill_in "Password confirmation", with: 'texas'
    click_on 'Submit'

    # save_and_open_page
    expect(current_path).to eq(links_path)
    expect(User.all.first.email_address).to eq('cdun@utexas.edu')
  end
end
