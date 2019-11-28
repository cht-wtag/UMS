# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Department, type: :model do
  let(:department) { create(:department) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_many(:courses).dependent(:destroy) }
  it { should have_many(:faculties).dependent(:destroy) }
  it { should have_many(:students).dependent(:destroy) }
end
