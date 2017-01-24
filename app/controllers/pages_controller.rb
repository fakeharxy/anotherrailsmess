class PagesController < ApplicationController
  before_action :create_page

  def index
    @pages = Page.all.reverse
    @pages.shift
  end

  def show
    @past_page = Page.find(params[:id])
    @paragraphs = @past_page.paragraphs.all
  end

  def new
    @paragraphs = @page.paragraphs.all
  end

  def set_paragraph
    @paragraph = @page.paragraphs.create(body: para_params[:body], num: @page.next_paragraph_number)
  end

  def set_todo
    page = params[:page] ? Page.find(params[:page]) : @page
    paragraph_to_update = page.find_paragraphs_by_num(params[:id])
    paragraph_to_update.update(todo: Date.today)
  end

  def set_important
    page = params[:page] ? Page.find(params[:page]) : @page
    paragraph_to_update = page.find_paragraphs_by_num(params[:id])
    paragraph_to_update.update(important: true)
  end

  private

  def create_page
    @page = Page.find_by(date: Date.today) || Page.create(date: Date.today)
  end

  def para_params
    params.permit(:body)
  end
end
