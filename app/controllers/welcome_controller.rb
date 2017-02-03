class WelcomeController < ApplicationController
  def index
    @important = Paragraph.all.where(important: true)
  end
end
