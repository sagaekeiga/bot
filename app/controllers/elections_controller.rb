class ElectionsController < ApplicationController
  
    def new
     @election = Election.new
    end

    def create
     @election = Election.new(election_params)
     @election.save
     redirect_to elections_path
    end
    
    def destroy
        @election = Election.find(params[:id])
        if @election.delete
         flash[:success] = "deleted"
        end
        redirect_to elections_path
    end
    
    def index
      @tasks = Task.all
      @elections = Election.all
      @election = Election.new
      @task = Task.new
    end
    
    def show
      @election = Election.find(params[:id])
    end
    
    def edit
        @election = Election.find(params[:id])
    end
    
    def update
        @election = Election.find(params[:id])
        @election.update(election_params)
        redirect_to elections_path
    end

    

    
      private
      
        def election_params
          params.require(:election).permit(:name, :description, :status)
        end
end
