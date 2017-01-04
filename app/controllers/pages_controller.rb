class PagesController < ApplicationController
  def new
        @page = Page.create(date: Date.today) unless (Page.exists?(date: Date.today))
  end

  def set_paragraph
       @page = Page.find_by(date: Date.today)
       @paragraph = @page.paragraphs.create(body: para_params[:body], num: para_params[:para])
  end

  private

  def para_params
    params.permit(:body, :para)
  end
end
