class Site < ActiveRecord::Base
  # -- associations
  has_many :services

  # -- configuration
  CONNECTION_TYPES = ['unix://']

  # -- validations and callbacks
  validates :name, presence: true, uniqueness: true
  validates :connection_type, format: { with: /\A(unix:\/\/)\z/}
  validates :uri, presence: true

  def to_s
    "#{name}"
  end

  def path
    "#{connection_type}#{uri}"
  end


end
