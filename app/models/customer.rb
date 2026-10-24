# Customer model: represents one row in the customers table.
class Customer < ApplicationRecord
  # ActiveStorage: lets each customer have one attached image.
  has_one_attached :image

  # A customer can't be saved without a full name.
  # Email is intentionally NOT validated, since some customers have none.
  validates :full_name, presence: true

  # Active Admin 3+ (Ransack) requires an allowlist of searchable columns.
  def self.ransackable_attributes(auth_object = nil)
    %w[full_name phone_number email_address notes created_at updated_at]
  end

    # No associations are searchable. Returning an empty list also stops
  # Ransack from asking for allowlists on ActiveStorage's internal tables.
  def self.ransackable_associations(auth_object = nil)
    []
  end
end