class SnippetsController < ApplicationController

  before_action :authorized?, only: [:new, :edit, :destroy]

  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new snippet_params
    @snippet.user = current_user

    if @snippet.save
      redirect_to root_path
    else
      render :new
    end

  end


  private

  def snippet_params
    snippet_params = params.require(:snippet).permit(:kind_id, :title, :body)
  end

end
