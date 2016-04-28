require 'rails_helper'
require './db/seeding/src/csv_parser'
require 'csv'

RSpec.describe CsvParser do  it 'provides translations' do
    expected = ['Monday', ['pondělí']]
    result = subject.parse(days_of_week_csv)[0]
    expect(result).to eq expected
  end
end

def days_of_week_csv
  CSV.parse('english,czech
Monday,pondělí
Tuesday,úterý
Wednesday,středa
Thursday,čtvrtek
Friday,pátek
Saturday,sobota
Sunday,neděle')
end