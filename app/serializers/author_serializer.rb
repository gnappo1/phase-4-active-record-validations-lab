class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number, :post_avg#, :created_posts
  has_many :created_posts, serializer: PostSerializer, key: :posts, if: :show_posts

  def show_posts
    self.object.created_posts.length > 0
  end

  def post_avg
    self.object.avg = 5.0
  end
end
