FactoryGirl.define do

  sequence :name do |n|
    "name_#{n}"
  end

  factory :site do
    name
    connection_type "unix://"
    uri "/path/to/socket"
  end
end
