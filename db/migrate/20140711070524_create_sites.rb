class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name,		 default: ""
      t.string :connection_type, default: ""
      t.string :uri,		 default: ""

      t.timestamps
    end
  end
end
