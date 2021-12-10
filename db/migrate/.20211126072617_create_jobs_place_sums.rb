class CreateJobsPlaceSums < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_place_sums do |t|

      t.timestamps
    end
  end
end
