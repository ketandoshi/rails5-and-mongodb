class Author
  include Mongoid::Document
  field :name, type: String
  field :author_bio, type: String
  field :profile_pic, type: String
  field :academics, type: String
  field :awards, type: String

  index(
    {
      name: 'text',
      author_bio: 'text',
      academics: 'text',
      awards: 'text'
    }
  )

  def self.search(q)
    where({ :$text => { :$search => q } })
  end
end
