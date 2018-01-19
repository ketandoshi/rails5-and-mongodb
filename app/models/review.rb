class Review
  include Mongoid::Document
  field :name_of_reviewer, type: String
  field :star_rating, type: Integer
  field :review_title, type: String
  field :review_description, type: String

  belongs_to :book

  index(
    {
      name_of_reviewer: 'text',
      review_title: 'text',
      review_description: 'text'
    }
  )

  def self.search(q)
    where({ :$text => { :$search => q } })
  end
end
