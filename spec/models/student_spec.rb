# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Student, type: :model do
  let(:student) { create(:student) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:roll) }
  it { should validate_length_of(:roll).is_at_most(50) }
  it { should belong_to(:department) }
  it { should validate_uniqueness_of(:roll) }
  it { should have_many(:courses).through(:registrations) }
  # it {should have_db_index(:name)}
end
