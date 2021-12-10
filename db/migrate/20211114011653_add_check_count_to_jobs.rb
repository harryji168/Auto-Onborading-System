class AddCheckCountToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :check_count, :bigint
  end
end
