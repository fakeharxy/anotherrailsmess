class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :create_page

  def index
    clean_up_pages
    @pages = current_user.pages.all.order(date: :desc).drop(1)
  end

  def show
    @past_page = current_user.pages.find(params[:id])
    cookies["past_page"] = @past_page.id
    @paragraphs = @past_page.paragraphs.all.order(:num)
  end

  def new
    @title = @page.title || 'New Page'
    @paragraphs = @page.paragraphs.all.order(:num)
  end

  def set_paragraph
    @new_paragraph = @page.paragraphs
      .create(body: para_params[:body],
    num: @page.next_paragraph_number)
    respond_to do |format|
      format.js
    end
  end

  def set_tags
    find_paragraph_by_id(params[:id])
      .apply_tag_or_tags(params[:tags])
    head :no_content
  end


  def set_todo
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .set_paragraph_as_todo(params[:date])
    head :no_content
  end

  def set_important
    find_page_if_archive
      .find_paragraph_by_num(params[:id])
      .switch_paragraphs_importance
  end

  def add_title
    find_page_if_archive
      .set_title(params[:title])
  end

  private

  def clean_up_pages
    @pages = current_user.pages.all.order(date: :desc).drop(1)
    @pages.each do |page|
      if page.paragraphs == []
        page.destroy
      end
    end
  end

  def find_paragraph_by_id(id)
    Paragraph.find_by(id: id)
  end

  def create_page
    @page = current_user.pages.find_by(date: Date.today) ||
      current_user.pages.create(date: Date.today)
  end

  def find_page_if_archive
    params[:page] ? Page.find(params[:page]) : cookies["past_page"] ? Page.find(cookies["past_page"]) : @page
  end

  def para_params
    params.permit(:body)
  end
end
