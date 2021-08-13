class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # raise
    @task = Task.find(params[:id])
  end

  def new
    # This creates an empty instance of Task
    @task = Task.new
  end

  def create
    #  raise, put a raise here then go to http://localhost:3000/tasks/new, fill in the form then play around with params[:task]
    # @task = Task.new(params[:task])
    # task_params is an updated version of params[:task] which is more secure.
    @task = Task.new(task_params)
    @task.save
    # Also today it doesn't matter if you do Task.new task.save or Task.create
    # Tomorrow we'll do validations, if save? ... do this else re render the form.

    redirect_to tasks_path(@task)
    # The prefix to the show page is task, so we redirect to the task_path which is the show page of all the tasks.
    # We need (@task) because the show page has a :id in the url which is dynamic, so you pass it the instance of @task for the id.
    # By default @task will take the id, if you want something else, like title you have to do @task.title.
  end

  def edit
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)

    redirect_to tasks_path(@task)
  end

  def destroy
  end

  private

  def task_params
    # Strong params - This says, only look at these fields, don't look at anything else.. e.g if a hacker came along and edited the html in
    # their browser to add another field to the form (permitted for example), whereby they could check the box permitted, and make their
    # new Task show up immediately without having to go through checks.
    params.require(:task).permit(:title, :details, :completed)
  end
end
