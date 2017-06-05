class PagesController < ApplicationController

  http_basic_authenticate_with name: "seijipress", password: "seijipress"

  def index
      @q = Bot.search(params[:q])
      @bots = Bot.all
  end
end
