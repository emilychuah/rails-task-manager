class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  # CRUD actions to be done on tasks
  # See all tasks - read(all)
  def index
    @tasks = Task.all
  end

  # See details about one task - read(one)
  def show
  end

  # Create a task
  ## GET the task creation form
  def new
    @task = Task.new # needed to instantiate the form_for
  end

  ## POST the parameters to create a new task
  def create
    # .create is the same as .new and .save
    @task = Task.create(task_params) # use strong params

    redirect_to tasks_path # redirects to the tasks page
  end

  # Update a task
  ## GET the task form (pre-filled with task attributes) for editing
  def edit
  end

  ## PATCH the parameters to update an existing task
  def update
    @task.update(task_params) # use strong params

    redirect_to task_path(@task)
  end

  # Destroy a task
  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    # change permitted from false to true to fix the ActiveModel::ForbiddenAttributesError
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
