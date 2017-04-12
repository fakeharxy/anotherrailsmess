class WelcomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todos

  def index
    begin_new_day if current_user.first_daily_log_on?
    @tag = current_user.owned_tags.order("last_seen").last
    @para_of_the_day = Paragraph.tagged_with(@tag, :on => :tags, :owned_by => current_user).shuffle.first
  end

  def next_paragraph
    @important.set_lastseen_as_now
    set_important
    redirect_to '/'
  end

  def paragraph_remove_todo
    current_user.paragraphs.find_by(id: params['body'].to_i).remove_todo
  end

  private

  # def set_important
  #   @important = current_user.paragraphs.where(important: true).order(:lastseen).first
  # end

  def begin_new_day
    @tag = current_user.owned_tags.order("last_seen").first
      @tag.update(last_seen: Date.today) if @tag
      current_user.update(new_day: Date.today)
  end

  def set_todos
    @any = current_user.paragraphs.where.not(todo: nil)
    @todos_past = current_user.paragraphs.where("todo < ?", Date.today).order(:todo)
    @todos_present = current_user.paragraphs.where(todo: Date.today).order(:body)
    @todos_tomorrow = current_user.paragraphs.where(todo: Date.tomorrow).order(:body)
    @todos_future = current_user.paragraphs.where("todo > ?", Date.tomorrow).order(:todo)
  end
end

