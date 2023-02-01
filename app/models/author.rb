class Author < ApplicationRecord
    validates :name, presence: true, uniqueness: {case_sensitive: false}
    validates :phone_number, length: {is: 10, message: "%{value} is not 10 digits, come on dude!"}
    # validates_presence_of :name
end
