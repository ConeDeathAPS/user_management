require 'rails_helper'

RSpec.describe User, type: :model do
    it 'requires a first name' do
    	user = User.create(first_name: "", last_name: "Sorensen", email:"Sorensenapaul@gmail.com", password:"password")
    	expect(user.valid?).to eq(false)
    end
    it 'requires a last name' do
    	user = User.create(first_name: "Andrew", last_name: "", email:"Sorensenapaul@gmail.com", password:"password")
    	expect(user.valid?).to eq(false)
    end
    it 'requires a password' do
    	user = User.create(first_name: "Andrew", last_name: "Sorensen", email:"Sorensenapaul@gmail.com", password:"")
    	expect(user.valid?).to eq(false)
    end
    it 'accepts properly formatted emails' do
    	user = User.create(first_name: "Andrew", last_name: "Sorensen", email:"Sorensenapaul@gmail.com", password:"password")
    	expect(user.valid?).to eq(true)
    end
    it 'rejects improperly formatted emails' do
    	user = User.create(first_name: "Andrew", last_name: "Sorensen", email:"Sorensenapaulgmailcom", password:"password")
    	expect(user.valid?).to eq(false)
    end
end
