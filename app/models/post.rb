class Post < ApplicationRecord
    belongs_to :creator, class_name: "Author", foreign_key: 'author_id'
    has_many :favorites, dependent: :destroy
    has_many :commentors, through: :favorites, source: :author
    # Object lifecycle callback
    before_validation :capitalize_category_name

    # validations
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validates :title, format: {with: /Won't Believe|Secret|Top \d|Guess/i, message: "not clickbaity enough sir!"}
    # validates :category, inclusion: {in: %w(Fiction Non-Fiction)}

    # validate :true_facts

    def capitalize_category_name
        if self.category
            self.category = self.category.split("-").map(&:capitalize).join("-")
        end
    end

    def true_facts
        if [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i].none? {|pattern| pattern.match(title)}
            errors.add(:title, "Not clickbaity enough sir!")
        end


    end

end
