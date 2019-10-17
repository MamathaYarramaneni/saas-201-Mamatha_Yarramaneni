class Student < ApplicationRecord  
  # associations
  belongs_to :department
  belongs_to :section

  # validations
  validates :name, presence: true
 # validates :email, presence: true, uniqueness: true
  validates :section_id , presence: true
  validates :department_id , presence: true

  validate :validate_section_mapping

  # callbacks
  before_create :generate_roll_no

  private

  def validate_section_mapping
    section = Section.find_by_id(section_id)
    department=Department.find_by_id(department_id)
    if section.nil?
      errors.add(:section,"sections field can't be empty")
    elsif section.department_id != department.id
      errors.add(:section, "Selected section doesn't belongs to selected department")
    end
  end

  def generate_roll_no
    max_count = Student.count
    #self.roll_no=max_count
    department_name = department.name.downcase.gsub(/\s/, '-')
    section_name = section.name.downcase.gsub(/\s/, '-')
    max_count=max_count+1;
     self.roll_no = "#{department_name}-#{section_name}-#{max_count}"
  end
end

