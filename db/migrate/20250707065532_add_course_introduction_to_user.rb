class AddCourseIntroductionToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :course_introduction, :text
  end
end
