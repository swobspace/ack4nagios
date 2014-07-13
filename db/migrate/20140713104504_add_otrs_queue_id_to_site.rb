class AddOtrsQueueIdToSite < ActiveRecord::Migration
  def change
    add_reference :sites, :otrs_queue, index: true
  end
end
