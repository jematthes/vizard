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

RSpec.describe ActivitiesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Activity. As you add validations to Activity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {title: "Title", description: "Description"}
  }

  let(:invalid_attributes) {
    {title: "", description: "Description"}
  }

  before(:each) do
    @project = create(:project)
    @objective = create(:objective)
    @project.objectives << @objective
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ActivitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all activities as @activities" do
      activity = Activity.create! valid_attributes
      get :index, {project_id: @project, objective_id: @objective}, valid_session
      expect(assigns(:activities)).to eq([activity])
    end

    it "should display a json with all activities" do
      activity = Activity.create! valid_attributes
      get :index, {project_id: @project, objective_id: @objective}, valid_session, :format => 'json'
      # expect(JSON.parse(response.body)).to include "Political will"
      expect(assigns(:activities).length).to eq(1)
    end

    it "should display a filtered activities by objective_id" do
      outcome_one     = create :outcome
      outcome_two     = create :outcome

      activity_one    = Activity.create! valid_attributes
      activity_two    = Activity.create! valid_attributes
      activity_three  = Activity.create! valid_attributes

      outcome_one.activities << activity_one
      outcome_one.activities << activity_three

      get :index, {project_id: @project, objective_id: @objective, outcome_id: outcome_one}, valid_session
      expect(assigns(:activities)).not_to include(activity_two)
    end
  end

  describe "GET show" do
    it "assigns the requested activity as @activity" do
      activity = Activity.create! valid_attributes
      get :show, {project_id: @project, objective_id: @objective, :id => activity.to_param}, valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      get :new, {project_id: @project, objective_id: @objective}, valid_session
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity as @activity" do
      activity = Activity.create! valid_attributes
      get :edit, {project_id: @project, objective_id: @objective, :id => activity.to_param}, valid_session
      expect(assigns(:activity)).to eq(activity)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, {project_id: @project, objective_id: @objective, :activity => valid_attributes}, valid_session
        }.to change(Activity, :count).by(1)
      end

      it "assigns a newly created activity as @activity" do
        post :create, {project_id: @project, objective_id: @objective, :activity => valid_attributes}, valid_session
        expect(assigns(:activity)).to be_a(Activity)
        expect(assigns(:activity)).to be_persisted
      end

      it "redirects to the created activity" do
        post :create, {project_id: @project, objective_id: @objective, :activity => valid_attributes}, valid_session
        expect(response).to redirect_to([@project, @objective, Activity.last])
      end

      it "creates a many to many relationship with outcomes" do
        outcome = create(:outcome)
        post :create, {project_id: @project, objective_id: @objective, :activity => valid_attributes.merge({outcome_ids:[outcome.id]})}, valid_session
        expect(assigns(:activity).outcomes).to include(outcome)
        expect(outcome.activities).to include(assigns(:activity))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        post :create, {project_id: @project, objective_id: @objective, :activity => invalid_attributes}, valid_session
        expect(assigns(:activity)).to be_a_new(Activity)
      end

      it "re-renders the 'new' template" do
        post :create, {project_id: @project, objective_id: @objective, :activity => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        {title:"Another Title"}
      }

      it "updates the requested activity" do
        activity = Activity.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => activity.to_param, :activity => new_attributes}, valid_session
        activity.reload
        expect(activity.attributes).to include(new_attributes.stringify_keys)
      end

      it "assigns the requested activity as @activity" do
        activity = Activity.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => activity.to_param, :activity => valid_attributes}, valid_session
        expect(assigns(:activity)).to eq(activity)
      end

      it "redirects to the activity" do
        activity = Activity.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => activity.to_param, :activity => valid_attributes}, valid_session
        expect(response).to redirect_to([@project, @objective, activity])
      end
    end

    describe "with invalid params" do
      it "assigns the activity as @activity" do
        activity = Activity.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => activity.to_param, :activity => invalid_attributes}, valid_session
        expect(assigns(:activity)).to eq(activity)
      end

      it "re-renders the 'edit' template" do
        activity = Activity.create! valid_attributes
        put :update, {project_id: @project, objective_id: @objective, :id => activity.to_param, :activity => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      activity = Activity.create! valid_attributes
      expect {
        delete :destroy, {project_id: @project, objective_id: @objective, :id => activity.to_param}, valid_session
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = Activity.create! valid_attributes
      delete :destroy, {project_id: @project, objective_id: @objective, :id => activity.to_param}, valid_session
      expect(response).to redirect_to(project_objective_activities_path(@project, @objective))
    end
  end

end
