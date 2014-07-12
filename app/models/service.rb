class Service < ActiveRecord::Base
  # -- associations
  belongs_to :site

  # -- configuration

  # -- validations and callbacks
  validates :site_id, :host, :service_description, presence: true, allow_blank: false

  def to_s
    "#{host} / #{service_description}"
  end

end
