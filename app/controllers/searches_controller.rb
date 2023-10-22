class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @content = params[:content]
    @target = params[:target]
    @conditions = params[:conditions]

    puts params

    case @target
    when "user"
      @records = User.search_for(:name, @content, @conditions)
    when "book"
      @records = Book.search_for(:title, @content, @conditions)
    end
  end
end
