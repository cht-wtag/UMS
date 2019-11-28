# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Faculty, type: :model do
  let(:faculty) { create(:faculty) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:position) }
  it { should validate_length_of(:position).is_at_most(100) }
  it { should belong_to(:department) }
  # it {should have_db_index(:name)}
end
