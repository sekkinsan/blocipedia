class Wiki < ApplicationRecord
  belongs_to :user, optional: true

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) do
    return all if user.premium? || user.admin?
    where(private: [false, nil])
  end
  

end
