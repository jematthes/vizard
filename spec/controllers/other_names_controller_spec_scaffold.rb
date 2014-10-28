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

RSpec.describe OtherNamesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # OtherName. As you add validations to OtherName, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OtherNamesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all other_names as @other_names" do
      other_name = OtherName.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:other_names)).to eq([other_name])
    end
  end

  describe "GET show" do
    it "assigns the requested other_name as @other_name" do
      other_name = OtherName.create! valid_attributes
      get :show, {:id => other_name.to_param}, valid_session
      expect(assigns(:other_name)).to eq(other_name)
    end
  end

  describe "GET new" do
    it "assigns a new other_name as @other_name" do
      get :new, {}, valid_session
      expect(assigns(:other_name)).to be_a_new(OtherName)
    end
  end

  describe "GET edit" do
    it "assigns the requested other_name as @other_name" do
      other_name = OtherName.create! valid_attributes
      get :edit, {:id => other_name.to_param}, valid_session
      expect(assigns(:other_name)).to eq(other_name)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new OtherName" do
        expect {
          post :create, {:other_name => valid_attributes}, valid_session
        }.to change(OtherName, :count).by(1)
      end

      it "assigns a newly created other_name as @other_name" do
        post :create, {:other_name => valid_attributes}, valid_session
        expect(assigns(:other_name)).to be_a(OtherName)
        expect(assigns(:other_name)).to be_persisted
      end

      it "redirects to the created other_name" do
        post :create, {:other_name => valid_attributes}, valid_session
        expect(response).to redirect_to(OtherName.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved other_name as @other_name" do
        post :create, {:other_name => invalid_attributes}, valid_session
        expect(assigns(:other_name)).to be_a_new(OtherName)
      end

      it "re-renders the 'new' template" do
        post :create, {:other_name => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested other_name" do
        other_name = OtherName.create! valid_attributes
        put :update, {:id => other_name.to_param, :other_name => new_attributes}, valid_session
        other_name.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested other_name as @other_name" do
        other_name = OtherName.create! valid_attributes
        put :update, {:id => other_name.to_param, :other_name => valid_attributes}, valid_session
        expect(assigns(:other_name)).to eq(other_name)
      end

      it "redirects to the other_name" do
        other_name = OtherName.create! valid_attributes
        put :update, {:id => other_name.to_param, :other_name => valid_attributes}, valid_session
        expect(response).to redirect_to(other_name)
      end
    end

    describe "with invalid params" do
      it "assigns the other_name as @other_name" do
        other_name = OtherName.create! valid_attributes
        put :update, {:id => other_name.to_param, :other_name => invalid_attributes}, valid_session
        expect(assigns(:other_name)).to eq(other_name)
      end

      it "re-renders the 'edit' template" do
        other_name = OtherName.create! valid_attributes
        put :update, {:id => other_name.to_param, :other_name => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested other_name" do
      other_name = OtherName.create! valid_attributes
      expect {
        delete :destroy, {:id => other_name.to_param}, valid_session
      }.to change(OtherName, :count).by(-1)
    end

    it "redirects to the other_names list" do
      other_name = OtherName.create! valid_attributes
      delete :destroy, {:id => other_name.to_param}, valid_session
      expect(response).to redirect_to(other_names_url)
    end
  end

end
