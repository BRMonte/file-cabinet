class DocsController < ApplicationController

  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all.order("created_at DESC") #organizes it from date + descending order
  end

  def show
    # no need to write anything cause before_action has all taken
  end

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      redirect_to @doc
    else
      render 'new'
    end

  end

  def edit
    # no need to write anything cause before_action has all taken
  end

  def update
    if @doc.update(doc_params)
      redirect_to @doc
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

  def find_doc
    @doc = Doc.find(params[:id])
  end

  def doc_params
    params.require(:doc).permit(:title, :content)
  end

end
