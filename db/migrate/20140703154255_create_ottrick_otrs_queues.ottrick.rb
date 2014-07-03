# This migration comes from ottrick (originally 20140603181759)
class CreateOttrickOtrsQueues < ActiveRecord::Migration
  def change
    create_table :ottrick_otrs_queues do |t|
      t.string :name
      t.integer :otrs_queue_id

      t.timestamps
    end
  end
end
