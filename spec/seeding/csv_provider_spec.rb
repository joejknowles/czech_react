require 'rails_helper'
require './db/seeding/src/csv_provider'

RSpec.describe CsvProvider do
  subject { CsvProvider.new('days')}
  it 'provides a csv object' do
    result = subject.contents
    expect(result.count).to eq 8
  end
end