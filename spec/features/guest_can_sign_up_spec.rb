require 'rails_helper'

describe "When a guest visits /" do
  it "they can sign up for an account" do
    visit "/"

    click_on 'Sign-up'

    expect(current_path).to eq(new_login_path)

    fill_in :email_address, with: 'cdun@utexas.edu'
    fill_in :password, with: 'texas'
    fill_in :password_confirmation, with: 'texas'

    expect(current_path).to eq(links_path)
    expect(User.all.first.email_address).to eq('cdun@utexas.edu')
  end
end
