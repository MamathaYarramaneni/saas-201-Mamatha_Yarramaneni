class Section < ApplicationRecord
	belongs_to :department
	 has_many :students, dependent: :destroy

	before_save :convertto_caps

	private
	
	def convertto_caps
	  self.name=self.name.upcase
	end
end
