class TasksController < ApplicationController

    def create
     @task = Task.new(task_params)
     @task.save
     redirect_to elections_path
    end
    
    def destroy
        @task = Task.find(params[:id])
        if @task.delete
         flash[:success] = "deleted"
        end
        redirect_to elections_path
    end
    
    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to elections_path
    end

    
      private
      
        def task_params
          params.require(:task).permit(:name, :deadline)
        end
end
