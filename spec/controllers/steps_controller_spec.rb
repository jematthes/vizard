require 'rails_helper'

RSpec.describe StepsController, :type => :controller do

  login_user
  # describe "GET index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET step1" do
    it "creates a new real_problem as @real_problem" do
      get :step1, {}
      expect(assigns(:real_problem)).to be_a_new RealProblem
    end
    it "renders the step1 template" do
      get :step1, {}
      expect(response).to render_template :step1
    end
  end

  describe "GET step2" do
    it "creates a new objetive as @objective" do
      get :step2, {}
      expect(assigns(:objective)).to be_a_new(Objective)
    end

    it "assigns an alrealdy created objective as @objective" do
      objective = create(:objective)
      get :step2, {objective_id: objective}
      expect(assigns(:objective)).to eq(objective)
    end

    it "lists all created objectives as @objectives" do
      objective = create(:objective)
      get :step2, {}
      expect(assigns(:objectives)).to include(objective)
    end
  end

  describe "GET step3" do
    it "render step3 template" do
      get :step3, {}
      response.should render_template :step3
    end
  end

  describe "GET step4" do
    it "render step4 template" do
      get :step4, {}
      response.should render_template :step4
    end
  end

end
