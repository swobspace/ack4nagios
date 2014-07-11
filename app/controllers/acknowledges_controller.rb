class AcknowledgesController < ApplicationController
  before_action :get_acknowledges, only: [:index]

  # GET /acknowledges
  def index
    @acknowledges = Acknowledge.all
    respond_with(@acknowledges)
  end

  private

    def find_acknowledges
      @acknowledges = []
    end

end
