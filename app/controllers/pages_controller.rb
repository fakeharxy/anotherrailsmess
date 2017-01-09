class PagesController < ApplicationController
  before_action :create_page

  def index
  end

  def new
    @paragraphs = @page.paragraphs.all
  end

  def set_paragraph
    @page = Page.find_by(date: Date.today)
    @paragraph = @page.paragraphs.create(body: para_params[:body], num: @page.count)
  end

  private

  def create_page
    @page = Page.find_by(date: Date.today) || Page.create(date: Date.today)
  end

  def para_params
    params.permit(:body)
  end
end
