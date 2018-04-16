class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :user_photo, UserPhotoUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :organization, optional: true
  has_many :steplists
  has_many :steps, through: :steplists
  has_many :visualizations
  has_many :visualized_steps, through: :visualizations, source: :step
  validates :first_name, :last_name, presence: true

  private
end
