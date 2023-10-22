module SearchesHelper
  def search_target
    {
      "User" => "user",
      "Book" => "book"
    }
  end

  def search_conditions
    {
      "完全一致" => "perfect",
      "前方一致" => "forward",
      "後方一致" => "backward",
      "部分一致" => "partial"
    }
  end
end
