require 'rails_helper'

describe User do 
	let!(:user) { User.create(username: "Justin", email: "jwag89@gmail.com", password:"jwag") }

	context "username" do
		it "should return the username" do  
			expect(user.username).to eq("Justin")
		end
	end

	context "email" do
		it "should return the email" do  
			expect(user.email).to eq("jwag89@gmail.com")
		end
	end

	context "password" do 
		it "should return the password" do 
			expect(user.password).to eq("jwag")
		end
	end

	describe "Invalid username" do 
		it "is invalid without a username" do 
			expect { User.new(:user, username: nil) }.to raise_error(ArgumentError)
		end

		context "invalid email" do 
			it "is invalid without an email" do 
				expect { User.new(:user, email: nil) }.to raise_error(ArgumentError)
			end
		end

		context "invalid password" do 
			it "is invalid without a password" do 
				expect { User.new(:user, password: nil) }.to raise_error(ArgumentError)	
			end
		end
	end

	describe "validates username" do 
		it { should validate_presence_of(:username) }
	
		context "validates presence of email" do 
			it { should validate_presence_of(:email) }
		end

		context "validates uniqueness of email" do 
			it { should validate_uniqueness_of(:email) }
		end

		context "validate length of password to be no less than 4 characters" do 
			it { should ensure_length_of(:password).is_at_least(4) }
		end
	end

	describe "associations" do 
		context "user has many topics" do 
			it { should have_many(:topics)}
		end

		context "user has many comments" do 
			it { should have_many(:comments) }
		end
	end
end





