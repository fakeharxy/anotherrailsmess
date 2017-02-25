class WelcomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_important, :set_todos

  def index
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

  def set_important
    @important = current_user.paragraphs.where(important: true).order(:lastseen).first
  end

  def set_todos
    @todos_past = current_user.paragraphs.where("todo < ?", Date.today).order(:todo)
    @todos_present = current_user.paragraphs.where(todo: Date.today).order(:body)
    @todos_tomorrow = current_user.paragraphs.where(todo: Date.tomorrow).order(:body)
    @todos_future = current_user.paragraphs.where("todo > ?", Date.tomorrow).order(:todo)
  end
end

