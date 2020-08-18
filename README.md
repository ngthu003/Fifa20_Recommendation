# Football player recommendation system


###### Background Information

> The main objectives of this project are:
>
> 1.  to make a recommendation system, in this case to recommend players given some search criteria (position, nationality, age, etc.);
> 2.  to make a simple interactive R Shiny web app, which gives users the search experience.
>
> This is done based on the data set of all professional (European) football players, available [here on Kaggle](https://www.kaggle.com/stefanoleone992/fifa-20-complete-player-dataset) (which was scraped and last updated from [https://sofifa.com/](https://sofifa.com/) on September 2019).

***

#### Plan of Action

It is my impression and belief from years of watching (and a short career of playing) football, players play best when they get to play in their preferred positions. As such, the idea to make the search position-focus: we will consider each position and look at the top players given some combinations of search criteria (for example by nationality, by age, or by potential, etc).

The current plan to approach this has the following key points:

1.  Explore the key attributes per position
2.  Compute the comprehensive ratings per player per position
3.  Search the top players given the search criteria.
