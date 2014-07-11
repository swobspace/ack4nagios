class Site < ActiveRecord::Base
  # -- associations

  # -- configuration
  CONNECTION_TYPES = ['unix://']

  # -- validations and callbacks
  validates :name, presence: true, uniqueness: true
  validates :connection_type, format: { with: /\A(unix:\/\/)\z/}
  validates :uri, presence: true

  def to_s
    "#{connection_type}#{uri}"
  end


end
