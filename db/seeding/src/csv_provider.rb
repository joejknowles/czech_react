require 'csv'
class CsvProvider
  RELATIVE_PATH = 'db/seeding/csvs/'
  FILE_EXT = '.csv'
  def initialize file_name
    @file_name = file_name
  end

  def contents
    CSV.read(full_file_path)
  end

  def full_file_path
    RELATIVE_PATH + @file_name + FILE_EXT
  end
end