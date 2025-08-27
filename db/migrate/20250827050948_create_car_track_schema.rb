class CreateCarTrackSchema < ActiveRecord::Migration[8.0]
  def up
    execute "CREATE SCHEMA IF NOT EXISTS car_track"
  end

  def down
    execute "DROP SCHEMA IF EXISTS car_track CASCADE"
  end
end
