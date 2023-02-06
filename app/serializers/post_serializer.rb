class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :summary, :category
end
