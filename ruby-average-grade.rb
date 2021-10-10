# frozen_string_literal: true

require 'json'

# Grade
class Grade
  def initialize(data_hash)
    @data_hash = data_hash
  end

  def calculate_average_grade
    "Average is #{average_grade}"
  end

  def all_passed_students
    "#{except_the_last_student(names_of_passed_students)} and #{get_last_student(names_of_passed_students)} are passed"
  end

  def all_failed_students
    "#{except_the_last_student(names_of_failed_students)} and #{get_last_student(names_of_failed_students)} are failed"
  end

  private

  def average_grade
    @data_hash.map { |grade| grade['grade'] }.sum / @data_hash.size
  end

  def group_by_status
    @data_hash.group_by { |student| student['grade'] < average_grade ? :failed : :passed }
  end

  def names_of_failed_students
    group_by_status[:failed].map { |student| student['name'] }
  end

  def names_of_passed_students
    group_by_status[:passed].map { |student| student['name'] }
  end

  def get_last_student(student_arr)
    student_arr.pop
  end

  def except_the_last_student(student_arr)
    student_arr.pop
    student_arr.join(', ')
  end
end

file = File.read('./grades.json')
data_hash = JSON.parse(file)
calculate_grade = Grade.new(data_hash)
puts calculate_grade.calculate_average_grade
puts calculate_grade.all_passed_students
puts calculate_grade.all_failed_students
