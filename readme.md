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
Not running yet but it will be at `@landgrantbot`