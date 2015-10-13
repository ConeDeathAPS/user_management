require 'rails_helper'
RSpec.describe 'creating user' do
  before do
    visit '/users/new'
  end
  it 'creates a new user and redirects to users page' do
    fill_in 'user[first_name]', with: 'Stephen'
    fill_in 'user[last_name]', with: 'Curry'
    fill_in 'user[email]', with: 'curry@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Create'
    expect(current_path).to eq('/users')
    expect(page).to have_text('Stephen')
  end
  it 'displays errors without correct input' do
    click_button 'Create'
    expect(page).to have_text("First name can't be blank")
    expect(page).to have_text("Last name can't be blank")
  end
end