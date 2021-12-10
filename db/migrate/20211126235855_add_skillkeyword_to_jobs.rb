class AddSkillkeywordToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :skills_keyword, :text
  end
end
