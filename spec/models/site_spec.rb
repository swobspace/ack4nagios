require 'rails_helper'

RSpec.describe Site, :type => :model do
  it { is_expected.to have_many(:services) }
  it { is_expected.to belong_to(:otrs_queue) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to allow_value('unix://').for(:connection_type) }
  it { is_expected.not_to allow_value('').for(:connection_type) }
  it { is_expected.to validate_presence_of(:uri) }

  it "should get plain factory working" do
    f = FactoryBot.create(:site)
    g = FactoryBot.create(:site)
    expect(f).to be_valid
    expect(g).to be_valid

    is_expected.to validate_uniqueness_of :name
  end
end
