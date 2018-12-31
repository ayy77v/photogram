class Post < ApplicationRecord
validates :user_id, presence: true

  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :owner, class_name: "User", foreign_key: :user_id
    has_many :comments, dependent: :destroy

end
