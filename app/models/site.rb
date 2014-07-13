class Site < ActiveRecord::Base
  # -- associations
  has_many :services
  belongs_to :otrs_queue, class: Ottrick::OtrsQueue, 
                          foreign_key: :otrs_queue_id

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
