class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :site, default: ""
      t.string :host, default: ""
      t.string :service_description, default: ""

      t.timestamps
    end
    add_index :services, :site
    add_index :services, :host
    add_index :services, :service_description
  end
end
