class CreateJobsDaySums < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_day_sums do |t|

      t.timestamps
    end
  end
end
