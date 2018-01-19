class Book
  include Mongoid::Document
  field :name_of_book, type: String
  field :short_description, type: String
  field :long_description, type: String
  field :chapter_index, type: Integer
  field :date_of_publication, type: Date
  field :genre, type: String

  has_many :reviews

  index(
    {
      name_of_book: 'text',
      short_description: 'text',
      long_description: 'text',
      genre: 'text'
    }
  )

  def self.search(q)
    where({ :$text => { :$search => q } })
  end
end
