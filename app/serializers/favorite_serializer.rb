class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :author, :post
  def post
    {id: self.object.post.id, title: self.object.post.title, content: self.object.post.content, summary: self.object.post.summary, category: self.object.post.category}
  end
end
