class Post < ActiveRecord::Base
belongs_to :author, class_name: "User"
has_many :comments, as: :commentable

  def publish!
    publish = true
    save!
  end

end
