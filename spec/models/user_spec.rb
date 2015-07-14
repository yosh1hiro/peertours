require 'rails_helper'

describe User do
  it "is valid firstname, lastname, email and password" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without firstname" do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without lastname" do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  describe 'Password' do
    context "with valid attributes" do
      it "is valid with a password of seven characters" do
        user = build(:user, password: "a" * 7, password_confirmation: "a" * 7)
        expect(user).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid with a password of five characters" do
        user = build(:user, password: "a" * 5, password_confirmation: "a" * 5)
        expect(user).not_to be_valid
      end

      it "is invalid with a password of fifteen" do
        user = build(:user, password: "a" * 15, password_confirmation: "a" * 15)
        expect(user).not_to be_valid
      end
    end
  end

  it "is invalid with duplicate email adress" do
    create(:user, email: "abc@gmail.com")
    user = build(:user, email: "abc@gmail.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
