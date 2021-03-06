class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
    @tasks = current_user.tasks.where(deadline: Date.today).where(status: false).order("priority DESC")
    @project = Project.new
    @task = Task.new
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  def cancel
    respond_to do |format|
      format.js
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to projects_path, notice: 'Project was successfully created.'}
        format.json {render :show, status: :created, location: @project}
      else
        format.html {render :new}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to root_path, notice: 'Project was successfully updated.'}
        format.json {render :show, status: :ok, location: @project}
      else
        format.html {render :edit}
        format.json {render json: @project.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    false_tasks_status = @project.tasks.where(status: false)
    if false_tasks_status.empty?
      @project.tasks.map {|t| t.destroy}
      @project.destroy
      respond_to do |format|
        format.html {redirect_to projects_url, notice: 'Project was successfully destroyed.'}
        format.json {head :no_content}
      end
    else
      respond_to do |format|
        format.html {redirect_to projects_url, notice: 'Project cannot be destroyed.'}
        format.json {head :no_content}
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:project).permit(:name, :color)
  end
end
