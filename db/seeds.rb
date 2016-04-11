# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#adjectives
LearnHelper.create_question english_sentence: 'small', czech_sentence: 'malý'
LearnHelper.create_question english_sentence: 'big', czech_sentence: 'velký'
LearnHelper.create_question english_sentence: 'tall', czech_sentence: 'vysoký'
LearnHelper.create_question english_sentence: 'poor', czech_sentence: 'chudý'
LearnHelper.create_question english_sentence: 'rich', czech_sentence: 'bohatý'
LearnHelper.create_question english_sentence: 'thin', czech_sentence: ['hubený', 'štihlý']
LearnHelper.create_question english_sentence: 'fat', czech_sentence: 'tlustý'
LearnHelper.create_question english_sentence: 'healthy', czech_sentence: 'zdravý'
LearnHelper.create_question english_sentence: 'sick', czech_sentence: 'nemocný'
LearnHelper.create_question english_sentence: 'weak', czech_sentence: 'slabý'
LearnHelper.create_question english_sentence: 'strong', czech_sentence: 'silný'
LearnHelper.create_question english_sentence: 'light', czech_sentence: 'lehký'
LearnHelper.create_question english_sentence: 'heavy', czech_sentence: 'těžký'
LearnHelper.create_question english_sentence: 'cold', czech_sentence: 'studený'
LearnHelper.create_question english_sentence: 'hot', czech_sentence: 'horký'
LearnHelper.create_question english_sentence: 'warm', czech_sentence: 'teplý'
LearnHelper.create_question english_sentence: 'young', czech_sentence: 'mladý'
LearnHelper.create_question english_sentence: 'old', czech_sentence: 'starý'
LearnHelper.create_question english_sentence: 'new', czech_sentence: 'nový'
LearnHelper.create_question english_sentence: 'clean', czech_sentence: 'čistý'
LearnHelper.create_question english_sentence: 'dirty', czech_sentence: 'špinavý'
LearnHelper.create_question english_sentence: 'cheap', czech_sentence: 'levný'
LearnHelper.create_question english_sentence: 'expensive', czech_sentence: 'drahý'
LearnHelper.create_question english_sentence: 'beautiful', czech_sentence: 'krásný'

LearnHelper.create_question english_sentence: 'ugly', czech_sentences: ['ošklivý', 'škaredý']

LearnHelper.create_question english_sentence: 'happy', czech_sentence: 'veselý'
LearnHelper.create_question english_sentence: 'sad', czech_sentence: 'smutný'



LearnHelper.create_question english_sentence: 'I am', czech_sentence: 'jsem'
LearnHelper.create_question english_sentence: 'You are', czech_sentence: 'jsi'