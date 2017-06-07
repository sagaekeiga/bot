class ElectionsController < ApplicationController

    def create
     @election = Election.new(election_params)
     if @election.save
       redirect_to elections_path
     else
       @elections = Election.all
       @waited_elections = Election.where(status: "待機")
       @doing_elections = Election.where(status: "稼働")
       @closed_elections = Election.where(status: "終了")
       @task = Task.new
       @tasks = Task.order("deadline")
       render 'elections/index'
     end
    end
    
    def destroy
        @election = Election.find(params[:id])
        if @election.delete
         flash[:success] = "deleted"
        end
        redirect_to elections_path
    end
    
    def index
      @tasks = Task.order("deadline")
      @elections = Election.all
      @election = Election.new
      @task = Task.new
      @waited_elections = Election.where(status: "待機")
      @doing_elections = Election.where(status: "稼働")
      @closed_elections = Election.where(status: "終了")
    end
    
    def delete_all
      @elections = Election.all
      @tasks = Task.all
      @elections.delete_all
      @tasks.delete_all
      redirect_to elections_path
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
          params.require(:election).permit(:name, :description, :article_id, :status, :worker)
        end
end
