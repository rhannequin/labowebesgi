class HomeController < ApplicationController
  def index
    @articles = Article.first(3)
  end
end
