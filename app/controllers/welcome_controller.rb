class WelcomeController < ApplicationController
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
    @important = Paragraph.all.where(important: true).order(:lastseen).first
  end

end

