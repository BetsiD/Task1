require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
	describe "GET index" do
    
    # it "check redirection" do
    # 	get :index
    #   expect(response).to redirect_to '/blogs'
    #   #is_expected.to respond_with :ok
    # end
    it "wrong redirection" do
    	post :create
      expect(response).not_to redirect_to new_blog_path
    end

    it "corect redirection" do
    	post :create
      expect(response).to redirect_to blogs_path
    end

    it "delete redirection" do
    	{:delete => '/blogs'}
      	expect(response.status).to eq 200
    end

    it "new status" do
    	get :new
      	expect(response.status).to eq 200
    end
    it "renders the correct template" do
      get :index
      expect(response).to render_template :index
    end

    it "renders the correct template" do
      get :index
      expect(response).to_not render_template :show
    end

end
end
