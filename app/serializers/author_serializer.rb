class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone_number
  has_many :created_posts
  has_many :favorites, serializer: FavoriteSerializer
end
