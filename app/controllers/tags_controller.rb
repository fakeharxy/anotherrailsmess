class TagsController < ApplicationController
  def index
  end
  
  def show
    @paragraphs = Paragraph.tagged_with(params[:id])
  end
end
