class TasksController < ApplicationController
  before_action :find_project, only: :search
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  def search
    @overdue_tasks = @project.tasks.where('deadline < ?', Date.today).where(status: false).order("priority DESC")
    @tasks = @project.tasks.where('deadline >= ?', Date.today).where(status: false).order("priority DESC")
    respond_to do |format|
      format.js {}
    end
  end

  def today
    @tasks = current_user.tasks.where(deadline: Date.today).where(status: false).order("priority DESC")
  end

  def next_seven_days
    @tasks = current_user.tasks.where('deadline > ?', Date.today).where('deadline <= ?', Date.today+7).where(status: false).order("priority DESC")
    respond_to do |format|
      format.js {}
    end
  end

  def completed
    @tasks = current_user.tasks.where(status: true)
    respond_to do |format|
      format.js {}
    end
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html {redirect_to @task, notice: 'Task was successfully created.'}
        format.json {render :show, status: :created, location: @task}
      else
        format.html {render :new}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to @task, notice: 'Task was successfully updated.'}
        format.json {render :show, status: :ok, location: @task}
      else
        format.html {render :edit}
        format.json {render json: @task.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html {redirect_to tasks_url, notice: 'Task was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  def find_project
    @project = current_user.projects.find(params[:project_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:name, :priority, :deadline_format, :status, :project_id)
  end
end
