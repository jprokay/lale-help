class Task < ActiveRecord::Base
  has_many :volunteer_assignments, -> { where(organizer: false) }
  has_many :organizer_assignments, -> { where(organizer: true) } , class_name: 'VolunteerAssignment'

  has_many :volunteers, through: :volunteer_assignments
  has_many :organizers, through: :organizer_assignments, source: :volunteer

  belongs_to :working_group

  has_many :skill_assignments
  has_many :skills, through: :skill_assignments

  has_many :location_assignments
  has_many :locations, through: :location_assignments

  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :working_group, presence: true

end
