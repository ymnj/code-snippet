class SnippetsController < ApplicationController

  before_action :authorized?, only: [:new, :edit, :destroy]
  before_action :find_snippet, only: [:show, :edit, :update, :destroy]

  def index
    @snippets = Snippet.all
    @kinds = Kind.all
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

  def edit  
  end

  def update
    if @snippet.update snippet_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @snippet.destroy
    redirect_to root_path, notice: "Snippet has been destroyed"
  end

  def show

  end




  private

  def find_snippet
    @snippet = Snippet.find params[:id]
  end


  def snippet_params
    snippet_params = params.require(:snippet).permit(:kind_id, :title, :body)
  end

end
