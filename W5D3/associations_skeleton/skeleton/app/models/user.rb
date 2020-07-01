# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :enrollments,
        class_name: :Enrollment,
        foreign_key: :student_id,
        primary_key: :id
    
    has_many :enrolled_courses,
       through: :enrollments #we go through an association within our current class
       source: :course

    has_many :courses_taught,
        class_name: :Course,
        foreign_key: :instructor_id,
        primary_key: :id

        
end

