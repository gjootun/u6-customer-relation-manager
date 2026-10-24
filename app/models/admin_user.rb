class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # Active Admin 3+ (Ransack) needs an allowlist of searchable columns.
  # Sensitive fields like encrypted_password are deliberately left out.
  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at]
  end

  # No associations are searchable.
  def self.ransackable_associations(auth_object = nil)
    []
  end
end