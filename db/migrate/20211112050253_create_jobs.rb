class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :linked_id
      t.string :title
      t.string :company
      t.string :place
      t.string :date
      t.text   :link
      t.string :senoritylevel
      t.string :function
      t.string :employmenttype
      t.string :industries
      t.string :salary
      t.text :required_skills

      t.timestamps
    end
  end
end
