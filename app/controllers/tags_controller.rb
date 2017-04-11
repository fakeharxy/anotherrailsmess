class TagsController < ApplicationController
  def index
    @tags = current_user.owned_tags
  end
  
  def show
    @paragraphs = Paragraph.tagged_with(params[:id])
  end
end
