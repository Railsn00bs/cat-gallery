require 'rails_helper'

RSpec.describe CatsController, type: :controller do
  describe "GET #index" do
    before do
      get :index
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(:ok)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "assigns the correct instance variables" do
      expect(assigns(:cat)).to be_a_new Cat
      expect(assigns(:all_cats)).to eq Cat.all
    end
  end

  describe "POST #create" do
    let(:cat_url) { "http://28.media.tumblr.com/tumblr_m0xn50jsZa1qz4axuo1_500.jpg" }
    let(:create_cat) { post :create, :cat => {:image_url => cat_url} }

    it "creates a new cat" do
      expect{create_cat}.to change{Cat.count}.by 1
    end

    it "creates the cat with the correct url" do
      create_cat

      expect(Cat.last.image_url).to eq cat_url
    end

    it "redirects to index" do
      create_cat

      expect(response).to be_a_redirect
      expect(response).to redirect_to '/'
    end
  end

  describe "GET #my_cats" do
    let(:user) { User.create!(:name => "Bob", :email => "test@example.com", :password => "password") }

    it "renders my_cats template" do
      sign_in :user, user
      get :my_cats

      expect(response).to render_template("my_cats")
    end
  end
end
