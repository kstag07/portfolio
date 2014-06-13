class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates :technologies_used, presence: true
  validates :name, length: {in: 4..255}, uniqueness: true

  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  #do_not_validate_attachment_file_type :image

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
