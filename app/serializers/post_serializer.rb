class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary, :category, :creator, :like_count
  # belongs_to :creator, key: :author, serializer: AuthorCustomSerializer

  def creator
    {
      name: self.object.creator.name, 
      id: self.object.creator.id, 
      phone_number: self.object.creator.phone_number
    }
  end

  def like_count
    self.object.favorites.length
  end


end
