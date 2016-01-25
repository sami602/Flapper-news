class Comment < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true, length: { minimum: 3 }
  belongs_to :post
  def as_json(options = {})
    super(options.merge(include: :user))
  end
end
