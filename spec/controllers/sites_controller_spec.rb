require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SitesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Site. As you add validations to Site, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:site)
  }

  let(:invalid_attributes) {{
    connection_type: 'notallowed'
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SitesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sites as @sites" do
      site = Site.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:sites)).to eq([site])
    end
  end

  describe "GET show" do
    it "assigns the requested site as @site" do
      site = Site.create! valid_attributes
      get :show, {:id => site.to_param}, valid_session
      expect(assigns(:site)).to eq(site)
    end
  end

  describe "GET new" do
    it "assigns a new site as @site" do
      get :new, {}, valid_session
      expect(assigns(:site)).to be_a_new(Site)
    end
  end

  describe "GET edit" do
    it "assigns the requested site as @site" do
      site = Site.create! valid_attributes
      get :edit, {:id => site.to_param}, valid_session
      expect(assigns(:site)).to eq(site)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Site" do
        expect {
          post :create, {:site => valid_attributes}, valid_session
        }.to change(Site, :count).by(1)
      end

      it "assigns a newly created site as @site" do
        post :create, {:site => valid_attributes}, valid_session
        expect(assigns(:site)).to be_a(Site)
        expect(assigns(:site)).to be_persisted
      end

      it "redirects to the created site" do
        post :create, {:site => valid_attributes}, valid_session
        expect(response).to redirect_to(Site.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved site as @site" do
        post :create, {:site => invalid_attributes}, valid_session
        expect(assigns(:site)).to be_a_new(Site)
      end

      it "re-renders the 'new' template" do
        post :create, {:site => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { uri: "/from/anywhere" }
      }

      it "updates the requested site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => new_attributes}, valid_session
        site.reload
        expect(site.uri).to be == "/from/anywhere"
      end

      it "assigns the requested site as @site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        expect(assigns(:site)).to eq(site)
      end

      it "redirects to the site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => valid_attributes}, valid_session
        expect(response).to redirect_to(site)
      end
    end

    describe "with invalid params" do
      it "assigns the site as @site" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => invalid_attributes}, valid_session
        expect(assigns(:site)).to eq(site)
      end

      it "re-renders the 'edit' template" do
        site = Site.create! valid_attributes
        put :update, {:id => site.to_param, :site => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested site" do
      site = Site.create! valid_attributes
      expect {
        delete :destroy, {:id => site.to_param}, valid_session
      }.to change(Site, :count).by(-1)
    end

    it "redirects to the sites list" do
      site = Site.create! valid_attributes
      delete :destroy, {:id => site.to_param}, valid_session
      expect(response).to redirect_to(sites_url)
    end
  end

end
