class Post < ApplicationRecord
    belongs_to :user
    has_attached_file :thumbnail, styles: { small: "64x64", med: "100x100", large: "200x200" }
    validates_attachment_content_type :thumbnail, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    validates :thumbnail, attachment_presence: true
    scope :uncensored, -> {where censored: nil}
    scope :censored, -> {where censored: true}
end
