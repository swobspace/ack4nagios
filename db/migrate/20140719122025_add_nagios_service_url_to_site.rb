class AddNagiosServiceUrlToSite < ActiveRecord::Migration
  def change
    add_column :sites, :nagios_service_url, :string
  end
end
