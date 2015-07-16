require 'rails_helper'

describe Tour do
  let(:valid_tour) { build(:tour) }

  it "has a valid factory" do
    expect(valid_tour).to be_valid
  end

  it "has tour flow" do
    expect(valid_tour.tour_flows.empty?).to be_falsey
  end

  it "is valid attributes" do
    expect(valid_tour).to be_valid
  end

  describe "name" do
    context "with valid attributes" do
      it "is valid with a name of 30 characters" do
        tour = build(:tour, name: 'a' * 30)
        expect(tour).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid with a name of 9 characters" do
        tour = build(:tour, name: 'a' * 9)
        tour.valid?
        expect(tour.errors[:name]).to include("is too short (minimum is 10 characters)")
      end

      it "is invalid with a name of 101 characters" do
        tour = build(:tour, name: "a" * 101)
        tour.valid?
        expect(tour.errors[:name]).to include("is too long (maximum is 100 characters)")
      end

    end
  end

  describe "outline" do
    context "with valid attributes" do
      it "is valid with a outline of 200 characters" do
        tour = build(:tour, outline: 'a' * 200)
        expect(tour).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid with a outline of 99 characters" do
        tour = build(:tour, outline: 'a' * 99)
        tour.valid?
        expect(tour.errors[:outline]).to include("is too short (minimum is 100 characters)")
      end

      it "is invalid with a outline of 1001 characters" do
        tour = build(:tour, outline: 'a' * 1001)
        tour.valid?
        expect(tour.errors[:outline]).to include("is too long (maximum is 1000 characters)")
      end
    end
   

  end

  describe "description" do
    context "with valid attributes" do
      it "is valid with a description of 1000 characters" do
        tour = build(:tour, description: 'a' * 1000)
        expect(tour).to be_valid
      end
    end

    context "with invalid attributes" do
      it "is invalid with a description of 99 characters" do
        tour = build(:tour, description: 'a' * 99)
        tour.valid?
        expect(tour.errors[:description]).to include("is too short (minimum is 100 characters)")
      end

      it "is invalid with a description of 5001 characters" do
        tour = build(:tour, description: 'a' * 5001)
        tour.valid?
        expect(tour.errors[:description]).to include("is too long (maximum is 5000 characters)")
      end
    end
  end

  it "is invalid without minimum_number" do
    tour = build(:tour, minimum_number: nil)
    tour.valid?
    expect(tour.errors[:minimum_number]).to include("can't be blank")
  end

  it "is invalid without maximum_number" do
    tour = build(:tour, maximum_number: nil)
    tour.valid?
    expect(tour.errors[:maximum_number]).to include("can't be blank")
  end

  it "is invalid without rendezvous" do
    tour = build(:tour, rendezvous: nil)
    tour.valid?
    expect(tour.errors[:rendezvous]).to include("can't be blank")
  end
end
