require_relative '../seed_controller'
module Seeds
  module AllFiles
    def self.add_all
      seed file_names
    end

    def self.file_names
      Dir['db/seeding/csvs/*.csv'].map {|name| name[16..-5]}
    end

    def self.seed file_names
      file_names.each do |file_name|
        SeedController.seed file_name
      end
    end
  end
end