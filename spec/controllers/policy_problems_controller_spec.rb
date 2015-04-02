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

RSpec.describe PolicyProblemsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # PolicyProblem. As you add validations to PolicyProblem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Title", description: "Description"}
  }

  let(:invalid_attributes) {
    {title: "", description: "Description"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PolicyProblemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all policy_problems as @policy_problems" do
      policy_problem = PolicyProblem.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:policy_problems)).to eq([policy_problem])
    end
  end

  describe "GET show" do
    it "assigns the requested policy_problem as @policy_problem" do
      policy_problem = PolicyProblem.create! valid_attributes
      get :show, {:id => policy_problem.to_param}, valid_session
      expect(assigns(:policy_problem)).to eq(policy_problem)
    end
  end

  describe "GET new" do
    it "assigns a new policy_problem as @policy_problem" do
      get :new, {}, valid_session
      expect(assigns(:policy_problem)).to be_a_new(PolicyProblem)
    end
  end

  describe "GET edit" do
    it "assigns the requested policy_problem as @policy_problem" do
      policy_problem = PolicyProblem.create! valid_attributes
      get :edit, {:id => policy_problem.to_param}, valid_session
      expect(assigns(:policy_problem)).to eq(policy_problem)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PolicyProblem" do
        real_problem = RealProblem.create(title: "asdf")
        expect {
          post :create, {:policy_problem => valid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        }.to change(PolicyProblem, :count).by(1)
      end

      it "assigns a newly created policy_problem as @policy_problem" do
        real_problem = RealProblem.create(title: "asdf")
        post :create, {:policy_problem => valid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        expect(assigns(:policy_problem)).to be_a(PolicyProblem)
        expect(assigns(:policy_problem)).to be_persisted
      end

      it "redirects to the created policy_problem" do
        real_problem = RealProblem.create(title: "asdf")
        post :create, {:policy_problem => valid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        expect(response).to redirect_to(PolicyProblem.last)
      end

      it "creates a new Policy Problem, related to a RealProblem" do
        real_problem = RealProblem.create(title: "asdf")
        post :create, {:policy_problem => valid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        expect(assigns(:policy_problem).real_problem_id).to eq(real_problem.id)
        expect(assigns(:real_problem).policy_problems.count).to eq(1)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved policy_problem as @policy_problem" do
        real_problem = RealProblem.create(title: "asdf")
        post :create, {:policy_problem => invalid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        expect(assigns(:policy_problem)).to be_a_new(PolicyProblem)
      end

      it "re-renders the 'new' template" do
        real_problem = RealProblem.create(title: "asdf")
        post :create, {:policy_problem => invalid_attributes.merge(real_problem_id: real_problem.id)}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested policy_problem" do
        policy_problem = PolicyProblem.create! valid_attributes
        put :update, {:id => policy_problem.to_param, :policy_problem => new_attributes}, valid_session
        policy_problem.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested policy_problem as @policy_problem" do
        policy_problem = PolicyProblem.create! valid_attributes
        put :update, {:id => policy_problem.to_param, :policy_problem => valid_attributes}, valid_session
        expect(assigns(:policy_problem)).to eq(policy_problem)
      end

      it "redirects to the policy_problem" do
        policy_problem = PolicyProblem.create! valid_attributes
        put :update, {:id => policy_problem.to_param, :policy_problem => valid_attributes}, valid_session
        expect(response).to redirect_to(policy_problem)
      end
    end

    describe "with invalid params" do
      it "assigns the policy_problem as @policy_problem" do
        policy_problem = PolicyProblem.create! valid_attributes
        put :update, {:id => policy_problem.to_param, :policy_problem => invalid_attributes}, valid_session
        expect(assigns(:policy_problem)).to eq(policy_problem)
      end

      it "re-renders the 'edit' template" do
        policy_problem = PolicyProblem.create! valid_attributes
        put :update, {:id => policy_problem.to_param, :policy_problem => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested policy_problem" do
      policy_problem = PolicyProblem.create! valid_attributes
      expect {
        delete :destroy, {:id => policy_problem.to_param}, valid_session
      }.to change(PolicyProblem, :count).by(-1)
    end

    it "redirects to the policy_problems list" do
      policy_problem = PolicyProblem.create! valid_attributes
      delete :destroy, {:id => policy_problem.to_param}, valid_session
      expect(response).to redirect_to(policy_problems_url)
    end
  end

end
