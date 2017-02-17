class BotsController < ApplicationController
    
    def new
     @bot = Bot.new
    end

    def create
     @bot = Bot.new(bot_params)
     @bot.save
     redirect_to bots_path
    end
    
    def destroy
    end
    
    def index
        @bots = Bot.all
    end
    
    def show
      @bot = Bot.find(params[:id])
    end
    
      private
      
        def bot_params
          params.require(:bot).permit(:name, :url, :article_id, :date)
        end
end
