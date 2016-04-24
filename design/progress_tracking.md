Overall, I think with the main aim of making a useful learning application for myself, complex automatic progress tracking is not a high priority.
It involves database complexity which ActiveRecord isn't designed for, and causes a number of problems. Allowing navigation between lessons
and basic success streak feedback should be enough for me to manage my own learning effectively.

# What to track


#### Full sentences
  * Low granularity but manageable complexity
  * could be used to measure understanding of grammatical concepts
    
#### Czech Words
  * High granularity
  * Would need target language comprehension questions too 
  * Difficult to track the right Czech words. First outline would be:
    * EQ (English Question) -> ✓ CA (Czech Answer) Increase knowledge score for answer words
    * EQ -> x CA Decrease knowledge score for *recommended* answer words
    * CQ -> ✓ EA Increase knowledge score for question words
    * CQ -> x EA Decrease knowledge score for question words
  * With this data you could create a frequency weight for each sentence:
    * EQ frequency decided by knowledge score of 'recommended answer' words ?? deosn't make much sense if they always answer with other words
    * CQ frequency decided by knowledge score of question words
    
## Sentence storage
Reasons to store separately:
  * Allows single word progress tracking
  * Allows storage of word tables
  * Something like this could be necessary for word hints although it could be done differently
Reasons not to:
  * very complicated code
  * Makes punctuation difficult
  * Less time processing efficient
  * ActiveRecord isn't made for this (can't even find two equal sentences by their component words)

This dilemma brings into question my early decision to normalize all sentences by words. The space efficiency savings are negligible, 
and in the case of the source language where I can't imagine a scenario where the words need to be referenced individually, I no longer think
it's useful to structure the tables like this. I originially thought all words might be monitored for progress. or that having them separately
might be useful for sentence comparrison trees. The reasons they still might be useful are: 
  * word tables, but that's a long way off being implemented and would need multiple tables of its own anyway
  * word hints, but I don't particularly even like that feature

I still think that storing target language words separately will be useful eventually for complex tracking, but I can't see any reasons to 
implement this now. How to structure them against sentences will be tricky. Purely referencing words as foreign keys creates issues with
punctuation, so a hybrid approach could be useful, like storing a full string including punctuation, as well as a list of word references for the
purpose of progress monitoring.


## Database type

This also shows how active record is not right for the job. Even ruby on rails might not be very suitable. The database logic is very complex, and
the active record pattern aims to contain it all within models and behind the scenes. It's possible there is a more customizeable Rails ORM somewhere, but
it may be better to just move to another framework. 