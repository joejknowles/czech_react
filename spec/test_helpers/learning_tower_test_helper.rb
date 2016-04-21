module LearningTowerTestHelper
  def self.create_months_lesson
    VocabCreator.create(
        'months',
        ['january', 'leden'],
        ['february', 'únor'],
        ['march', 'březen'],
        ['april', 'duben'],
        ['may', 'květen'],
        ['june', 'červen'],
        ['july', 'červenec'],
        ['august', 'srpen'],
        ['september', 'září'],
        ['october', 'říjen'],
        ['november', 'listopad'],
        ['december', 'prosinec']
    )
  end
end