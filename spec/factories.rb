FactoryBot.define do

  sequence :name do |n|
    "name_#{n}"
  end

  factory :service do
    host { generate(:name) }
    service_description { generate(:name) }
    association :site
  end

  factory :site do
    name
    connection_type "unix://"
    uri { ENV['LIVESTATUS_SOCKET'] }
  end

end
