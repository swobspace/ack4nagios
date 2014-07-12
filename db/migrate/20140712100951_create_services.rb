class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :site
      t.string :host, default: ""
      t.string :service_description, default: ""

      t.timestamps
    end
    add_index :services, :site_id
    add_index :services, :host
    add_index :services, :service_description
  end
end
