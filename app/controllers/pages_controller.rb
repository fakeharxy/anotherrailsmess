class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :create_page

  def index
    @pages = Page.all.order(date: :desc).drop(1)
  end

  def show
    @past_page = Page.find(params[:id])
    @paragraphs = @past_page.paragraphs.all.order(:num)
  end

  def new
    @title = @page.title || "New Page"
    @paragraphs = @page.paragraphs.all.order(:num)
  end

  def set_paragraph
    @new_paragraph = @page.paragraphs
      .create(body: para_params[:body], num: @page.next_paragraph_number)
    respond_to do |format|
      format.js
    end
  end

  def set_todo
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .set_paragraph_as_todo(params[:date])
  end

  def set_important
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .set_paragraph_as_important
  end

  def add_title
    find_page_if_archive
      .set_title(params[:title])
  end

  private

  def create_page
    @page = current_user.pages.find_by(date: Date.today) || current_user.pages.create(date: Date.today)
  end

  def find_page_if_archive
    params[:page] ? Page.find(params[:page]) : @page
  end

  def para_params
    params.permit(:body)
  end
end
