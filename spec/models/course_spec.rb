# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Course, type: :model do
  let(:course) { create(:course) }
  it { should validate_presence_of(:name) }
  it { should belong_to(:department) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:students).through(:registrations) }
end
