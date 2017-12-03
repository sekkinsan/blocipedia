class Wiki < ApplicationRecord
  belongs_to :user, optional: true
  has_many :users, through: :collaborators
  has_many :collaborators, dependent: :destroy

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nil])
  end

  def markdown_title
    markdown_to_html(self.title)
  end

  def markdown_body
    markdown_to_html(self.body)
  end

end
