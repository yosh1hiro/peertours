require 'rails_helper'

describe UsersController do
  describe 'admin access access' do
    describe 'GET #index' do
      it "populates an array of all users" do
        user = create(:user)
        get :index
        expect(assigns(:users)).to include user 
      end

    end

  end

  describe 'correct user access' do
    let(:steve) { create(:user, first_name: 'steve', last_name: 'jobs') }

    before :each do
      sign_in(steve)
    end


    describe 'GET #edit' do
      it "assigns the requested user to @user" do
        get :edit, id: steve
        expect(assigns(:user)).to eq steve
      end

      it "renders the :edit template" do
        get :edit, id: steve
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      let(:tim) { { first_name: 'tim', last_name: 'cook' } }

      context "with valid attributes" do
        it "locates the requested @user" do
          patch :update, id: steve, user: attributes_for(:user, tim)
          expect(assigns(:user)).to eq steve
        end

        it "changes @user's attributes" do
          patch :update, id: steve, user: attributes_for(:user, tim)
          steve.reload
          expect(steve.first_name).to eq 'tim'
          expect(steve.last_name).not_to eq 'jobs'
        end

        it "redirects to @user" do
          patch :update, id: steve, user: attributes_for(:user, tim)
          expect(response).to redirect_to steve
        end

      end

      context "with invalid attributes" do
        let(:invalid) { { first_name: 'tim', last_name: nil } }
        it "does not update the user in the database" do
          patch :update, id: steve, user: attributes_for(:user, invalid)
          steve.reload
          expect(steve.first_name).not_to eq 'tim'
          expect(steve.last_name).to eq 'jobs'
        end

        it "re-renders the :edit template" do
          patch :update, id: steve, user: attributes_for(:user, invalid)
          expect(response).to render_template :edit
        end

      end

    end

    describe 'DELETE #destroy' do
      before :each do
        @user = create(:user, email: "abc@gmail.com")
        sign_in(@user)
      end
      it "deletes the user from the database" do
        expect{
          delete :destroy, id: @user 
        }.to change(User, :count).by(-1)
      end

      it "redirects to root url" do
        delete :destroy, id: @user
        expect(response).to redirect_to root_url
      end
      
    end
  end

  describe 'public access' do
    describe 'GET #index' do
      it "redirects to root url" do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    describe "GET #show" do
      let(:user) { create(:user) }

      it "assigns the requested user to @user" do
        get :show, id: user
        expect(assigns(:user)).to eq user
      end

      it "renders the :show template" do
        get :show, id: user
        expect(response).to render_template :show
      end
    end

    describe "GET #new" do
      it "assigns a new User to @user" do
        get :new
        expect(assigns(:user)).to be_a_new(User)
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end

    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new user in the database" do
          expect{
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end

        it "redirects to users#show" do
          post :create, user: attributes_for(:user)
          expect(response).to redirect_to user_path(assigns(:user))
        end

      end

      context "with invalid attributes" do
        it "does not save the new user in the database" do
          expect{
            post :create, user: attributes_for(:invalid_user)
          }.not_to change(User, :count)
        end

        it "re-renders the :new template" do
          post :create, user: attributes_for(:invalid_user)
          expect(response).to render_template :new
        end

      end
      
    end

  end

  describe 'user access' do
    let(:jobs) { create(:user, first_name: 'steve', last_name: 'jobs') }
    describe 'GET #edit' do
      it 'redirects to root_url' do
        get :edit, id: jobs
        expect(response).to redirect_to root_url
      end
    end

    describe 'PATCH #update' do
      let(:cook) { { first_name: 'tim', last_name: 'cook' } }
      it "does not update the user in the datebase" do
        patch :update, id: jobs, user: attributes_for(:user, cook)
        jobs.reload
        expect(jobs.first_name).to eq 'steve'
        expect(jobs.last_name).not_to eq 'cook'
      end

      it "redirects to root_url" do
        patch :update, id: jobs, user: attributes_for(:user, cook)
        expect(response).to redirect_to root_url
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @user = create(:user)
      end
      it "does not delete the user from the database" do
        expect{
          delete :destroy, id: @user
        }.not_to change(User, :count)
      end

      it "redirects to root_url" do
        delete :destroy, id: @user
        expect(response).to redirect_to root_url
      end
    end
  end
end
