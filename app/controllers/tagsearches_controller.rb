class TagsearchesController < ApplicationController
  def search
    @content = params[:content]
    @books = Book.with_details.where("category LIKE?", "%#{@content}%")
  end
end
