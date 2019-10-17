class Department < ApplicationRecord
	has_many :sections, dependent: :destroy
	has_many :students, dependent: :destroy

	#validations
	validates :name,presence: true, uniqueness: true

	before_save :convertto_caps

	private
	
	def convertto_caps
	  self.name=self.name.upcase
	end
end
