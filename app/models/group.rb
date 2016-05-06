class Group < ActiveRecord::Base
	belongs_to :user
	has_many :group_members


	validates_uniqueness_of :name, scope: :user_id

	end
