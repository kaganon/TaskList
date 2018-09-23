class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end


  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end


  def new
    @task = Task.new
  end


  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end


  def edit
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end


  def update
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    end

    # check if the render path is the correct one?

    is_updated = @task.update(task_params)

    if is_updated
      redirect_to task_path(@task)
    else
      render :edit
    end
  end


  def destroy
    task = Task.find_by(id: params[:id])

    if task.nil?
      head :not_found
    end

    if task.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def complete
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    end

    @task.update_attribute(:completed, true)
    @task.update_attribute(:completion_date, Date.today)

    redirect_to root_path
  end


  def incomplete
    @task = Task.find_by(id: params[:id])

    if @task.nil?
      head :not_found
    end

    @task.update_attribute(:completed, false)
    @task.update_attribute(:completion_date, nil)

    redirect_to root_path
  end


  private

  def task_params
    return params.require(:task).permit(:action, :description, :completion_date, :completed, false)
  end


end
