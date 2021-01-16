class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :must_be_clickbait

    def must_be_clickbait
        if self.title
            title = self.title
            clickbait_title_words = ["Guess", "Secret", "Won't Believe"]
            if (clickbait_title_words.none? { |word| title.include?(word) }) && (!/Top\s\d+/.match?(title))
                errors.add(:title, "must be clickbait")
            end
        end
    end


          #  if title includes any of the following, raise and exception

end
