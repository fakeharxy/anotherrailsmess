class PagesController < ApplicationController
  before_action :create_page

  def index
    @pages = Page.all.reverse
    @pages.shift
  end

  def show
    @past_page = Page.find(params[:id])
    @paragraphs = @past_page.paragraphs.all.order(:num)
  end

  def new
    @paragraphs = @page.paragraphs.all.order(:num)
  end

  def set_paragraph
    @page.paragraphs
      .create(body: para_params[:body], num: @page.next_paragraph_number)
  end

  def set_todo
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .set_paragraph_as_todo
  end

  def set_important
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .set_paragraph_as_important
  end

  private

  def create_page
    @page = Page.find_by(date: Date.today) || Page.create(date: Date.today)
  end

  def find_page_if_archive
    params[:page] ? Page.find(params[:page]) : @page
  end

  def para_params
    params.permit(:body)
  end
end
