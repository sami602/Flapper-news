class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 3 }
  has_many :comments

  def as_json(options = {})
    super(options.merge(include: [:user, comments: {include: :user}]))
  end
end
