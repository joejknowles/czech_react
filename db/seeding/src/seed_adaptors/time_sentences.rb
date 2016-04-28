require_relative '../seed_controller'
module Seeds
  module TimeSentences
    def self.add_all
      add_months
      add_days
    end

    def self.add_months
      SeedController.seed 'months'
    end

    def self.add_days
      SeedController.seed 'days'
    end
  end
end