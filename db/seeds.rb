# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require_relative './seeding/src/seed_adaptors/all_files'
require_relative './seeding/src/seed_adaptors/adjectives'
require_relative './seeding/src/seed_controller'
require './app/src/lesson_input/vocab_creator'


Seeds::AllFiles.add_all