class WelcomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_important

  def index
  end

  def next_paragraph
    @important.set_lastseen_as_now
    set_important
    redirect_to '/'
  end

  private

  def set_important
    @important = current_user.paragraphs.where(important: true).order(:lastseen).first
  end

end

