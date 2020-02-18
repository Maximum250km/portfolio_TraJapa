require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with an email,nationality, account_name, and password" do
  user = User.new(
  	email: "test@test",
  	account_name: "tester",
    password: "123456",
    nationality: "United States",
    )
  expect(user).to be_valid
end
 it "is invalid without an email" do
  user = User.new(email: nil)
  user.valid?
  expect(user.errors[:email]).to include("can't be blank")
end
  it "is invalid without an account_name" do
  user = User.new(account_name: nil)
  user.valid?
  expect(user.errors[:account_name]).to include("is too short (minimum is 2 characters)")
end
  it "is invalid with a duplicate email address" do
  	User.create(
  		account_name: "Boris",
  		email:"russia@russia",
  		nationality:"Russia (Россия)",
  	  password:"123456",
  	  )
    user = User.new(
    	account_name: "Ivan",
    	email:"russia@russia",
    	nationality:"Russia (Россия)",
    	password:"123456",
    	)
     user.valid?
     expect(user.errors[:email]).to include("has already been taken")
end
end