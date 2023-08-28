class Tenant < ApplicationRecord
  # app/models/tenant.rb
  validates :student_id, :email, uniqueness: true
  validates :name, :student_id, :phone_number, :maters_number, :program, :level, presence: true
  mount_uploader :profile_image, ProfileImageUploader

  belongs_to :room
  has_many :dues
  has_secure_password
end