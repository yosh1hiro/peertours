require 'rails_helper'

describe ToursController do
  before :each do
    @user = create(:user)
    @tour = create(:tour, host: @user)
  end
  describe "GET #index" do
    it "populates an array of all tours" do
      get :index
      expect(assigns(:tours)).to include @tour
    end
  end

  describe "GET #show" do
    it "assigns the requested tour to @tour" do
      get :show, id: @tour
      expect(assigns(:tour)).to eq @tour
    end

    it "renders the :show template" do
      get :show, id: @tour
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Tour to @tour" do
      get :new
      expect(assigns(:tour)).to be_a_new(Tour)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new tour in the database" do
        expect{
          post :create, tour: attributes_for(:tour)
        }.to change(Tour, :count).by(1)
      end

      it "redirects to tour#show" do
        post :create, tour: attributes_for(:tour)
        expect(response).to redirect_to tour_path(assigns(:tour))
      end
    end

    context "with invalid attributes" do
      it "does not save the new tour in the database" do
        expect{
          post :create, tour: attributes_for(:invalid_tour)
        }.not_to change(Tour, :count)
      end

      it "re-redirects the :new template" do
        post :create, tour: attributes_for(:invalid_tour)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested tour to @tour" do
      get :edit, id: @tour
      expect(assigns(:tour)).to eq @tour
    end

    it "renders the :edit template" do
      get :edit, id: @tour
      expect(response).to render_template :edit
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "locates the requested @tour" do
        patch :update, id: @tour, tour: attributes_for(:tour, minimum_number: 2)
        expect(assigns(:tour)).to eq @tour
      end

      it "changes @tour's attributes" do
        patch :update, id: @tour, tour: attributes_for(:tour, minimum_number: 2)
        @tour.reload
        expect(@tour.minimum_number).not_to eq 1
        expect(@tour.minimum_number).to eq 2
      end

      it "redirects to @tour" do
        patch :update, id: @tour, tour: attributes_for(:tour, minimum_number: 2)
        expect(response).to redirect_to @tour
      end
    end

    context "with invalid attributes" do
      it "does not update the tour in the database" do
        patch :update, id: @tour, tour: attributes_for(:tour, name: 'abc')
        @tour.reload
        expect(@tour.name).to eq 'Traditional Asakusa in Beautiful Kimono'        
        expect(@tour.name).not_to eq 'abc'
      end

      it "re-renders the :edit template" do
        patch :update, id: @tour, tour: attributes_for(:tour, name: 'abc')
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the tour from the database" do
      expect{
        delete :destroy, id: @tour
      }.to change(Tour, :count).by(-1)
    end

    it "redirects to root url" do
      delete :destroy, id: @tour
      expect(response).to redirect_to root_url
    end
  end
end
