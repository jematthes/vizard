class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy, :solutions, :public, :stage1, :stage2, :share]

  respond_to :html, :json

  def stage1
  end

  def stage2
  end

  def solutions
    @solutions = []
    if !@project.real_problem.blank?
      @project.real_problem.policy_problems.each do |pp|
        pp.solutions.map {|s| @solutions << s}
      end
    end
    # respond_with(@project, @solutions)
    render template: 'solutions/index.json.jbuilder'
  end

  def index
    @projects = current_user.projects
    respond_with(@projects)
  end

  def show
    authorize @project
    @objectives = @project.objectives
    @a_size = 0
    @barriers_size = 0
    @factors_size = 0
    @outcomes_size = 0
    @objectives.each do |o|
      @a_size = @a_size + o.actors.size
      @barriers_size = @barriers_size + o.barriers.size
      @factors_size = @factors_size + o.enabling_factors.size
      @outcomes_size = @outcomes_size + o.outcomes.size
    end

    if !@project.real_problem.blank?
      @real_problem = @project.real_problem
      if !@project.real_problem.try(:policy_problems).try(:blank?)
        @policy_problems = @project.real_problem.policy_problems
        if !@project.real_problem.try(:get_solutions).try(:blank?)
          @solutions = @project.real_problem.get_solutions
        end
      end
    end

    # @policy_problems = @project.real_problem.policy_problems || PolicyProblem.none
    # @solutions = @project.real_problem.policy_problems.first.solutions || Solution.none
    respond_with(@project)
  end

  def public
    # authorize @project
    @objectives = @project.objectives
    @actors_size = 0
    @barriers_size = 0
    @factors_size = 0
    @outcomes_size = 0
    @objectives.each do |o|
      @actors_size = @actors_size + o.actors.size
      @barriers_size = @barriers_size + o.barriers.size
      @factors_size = @factors_size + o.enabling_factors.size
      @outcomes_size = @outcomes_size + o.outcomes.size
    end

    if !@project.real_problem.blank?
      @real_problem = @project.real_problem
      if !@project.real_problem.try(:policy_problems).try(:blank?)
        @policy_problems = @project.real_problem.policy_problems
        if !@project.real_problem.try(:get_solutions).try(:blank?)
          @solutions = @project.real_problem.get_solutions
        end
      end
    end

    # @policy_problems = @project.real_problem.policy_problems || PolicyProblem.none
    # @solutions = @project.real_problem.policy_problems.first.solutions || Solution.none
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
  end

  def create
    new_params = project_params
    new_params[:public] = false if new_params[:public].nil?
    @project = Project.create(new_params)

    if !@project.id.blank?
      @project.users << current_user

      permission = Permission.where(project_id: @project.id ).where(user_id: current_user.id).first
      permission.role = :owner
      permission.save
    end

    respond_with(@project)
  end

  def update
    new_params = project_params
    new_params[:public] = false if new_params[:public].nil?
    @project.update(new_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  def share
    message = params[:message]
    params[:share_users].split(",").each do |u|
      u = u.to_s.strip
      share_user = User.find_by_email(u)
      if share_user.blank?
        generated_password = Devise.friendly_token.first(8)
        new_user = User.create(email: u, password: generated_password)
        raw_token, hashed_token = Devise.token_generator.generate(User, :reset_password_token)
        new_user.reset_password_token = hashed_token
        new_user.reset_password_sent_at = Time.now.utc
        new_user.save
        @project.users << new_user

        permission = Permission.where(project_id: @project.id ).where(user_id: new_user.id).first
        permission.role = :collaborator
        if permission.save
          data_send = {email: new_user.email, message: message, token: raw_token, project: @project}
          UserMailer.new_user_share(data_send).deliver_now
        end
      else
        @project.users << share_user

        permission = Permission.where(project_id: @project.id ).where(user_id: share_user.id).first
        permission.role = :collaborator
        if permission.save
          data_send = {email: share_user.email, message: message, project: @project}
          UserMailer.exist_user_share(data_send).deliver_now
        end
      end
    end
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to(new_project_path, :notice => 'Project not found')
    end

    def project_params
      params[:project].permit(:title, :description, :public, :focus_area)
    end
end
