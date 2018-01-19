class Searcher

  def initialize(q)
    @search_term = q
  end

  def get_search_data
    authors = Author.search(@search_term)
    books = Book.search(@search_term)
    reviews = Review.search(@search_term)

    authors.concat(books).concat(reviews)
  end
end