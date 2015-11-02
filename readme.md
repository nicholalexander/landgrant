
#LandGrant

In the coming absence of Grantland's reporting, I thought it would make sense to download the entire site, build a Markov chain trained on the text for the articles, and occassionally tweet out newly created sentences.

##Download Grantland.com
Using the venerable wget command, we build a local mirror of the site.

`wget -mkEpnp http://grantland.com`

At about 300,000 files and 4 GB, it took a while.

##Marky_Markov
Using the venerable [marky_markov](https://github.com/zolrath/marky_markov) gem, we recursively traverse the directories and train our dictionary on the stripped html files.

[Interesting SO on cleaning the html files.](http://stackoverflow.com/questions/2505104/html-to-plain-text-with-ruby)

##Twitter Bot
Not running automatically yet but it will be at `@landgrantbot`.  Current account - [https://twitter.com/landgrantbot](https://twitter.com/landgrantbot) is run manually by generating a sentence and pasting it in.

##Use
    require 'marky_markov'
    markov = MarkyMarkov::Dictionary.new('dictionary')
    markov.generate_2_sentences

Gets you:

>All her thinking is that he’s getting the minute Kanye brought in, because the story. Same old, same old, unoriginal stuff made some pals she thought they spoke in the hallway with the salty air after an experimental software upgrade grants him sentience and reads Grantland.

##Improvements
There's ocassionally some garbage in the output because the cleaning process wasn't perfect.  Also, it's double counting in the dictionary because it's running over the printed version of the article pulled down from the wget.  Getting a cleaner dictionary (and also experimenting with different levels) might help make the output be better.