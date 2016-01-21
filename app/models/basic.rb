class Basic < ActiveRecord::Base
	belongs_to :user
	has_many :educations, dependent: :destroy
   	has_many :experiences, dependent: :destroy
   	has_many :projects, dependent: :destroy
   	has_many :skills, dependent: :destroy
   	accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
   	accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
   	accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
   	accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

   	validates :full_name, presence: true
      validates :phone, format: { with: /\A(\+91\ ?)?\d{10}\z/ }, presence: true
end
