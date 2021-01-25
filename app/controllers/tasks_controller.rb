class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show
    # @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスク#{@task.name}を保存しました"
    else
      render 'new'
    end
  end

  def edit
    # @task = current_user.tasks.find(params[:id])
  end

  def update
    # @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク#{@task.name} を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    # @task = current_user.tasks.find(params[:id])
    @task.destroy
    redirect_to tasks_url, notice: "タスク#{@task.name}を削除しました"
  end

  private
  def task_params
    params.require(:task).permit(:name, :descroption)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end
