class Author < ApplicationRecord
    has_many :created_posts, class_name: "Post", dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :liked_posts, through: :favorites, source: :post

    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :phone_number, length: {is: 10, message: "%{value} is not 10 digits, come on dude!"}
    # validates_presence_of :name
end
