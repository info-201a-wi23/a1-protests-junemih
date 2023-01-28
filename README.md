# Assignment 1: Protests

During the past few years in the United States, there has been a surge of protests in support of the Black Lives Matter movement, women's rights, trans rights, immigration reform, gun control, the environment, and many other social and political issues.

In this assignment, you will work with data from [CountLove](https://countlove.org/), a group that collects data about protests from across the United States, including information about the purpose of the protests, the location of the protests, as well as how many people attended the protests. This data has often been [cited by the *New York Times*](https://www.nytimes.com/2020/08/28/us/black-lives-matter-protest.html), among other major outlets.

Through this assignment, you will be able to answer questions including:
- What were the most attended and least attended protests in the US in the last 5 years?
- How many protests occurred in Washington state?
- How did the number of protests in 2019 compare to 2020, and why?
- Why are people protesting in the US? What are the biggest motivators?


This assignment is divided into 2 parts. You will complete your coding work in the `analysis.R` file, and you will write short answer responses related to critical analysis and reflection of the data in this `README.md` file. Before getting started on your coding work, you should complete the section **"Critical Analysis & Reflection: Before You Code"** below.

When you are finished with the assignment, be sure to push all changes to your GitHub repository and then submit the link on Canvas.

## Before You Code: Critical Analysis & Reflection

Before diving into this (or any) dataset, it's important to know where the data came from, and it's important to have or to seek out _domain familiarity_ — in other words, knowledge about the subject/topic of the dataset. (We don't want to be "strangers in the dataset," as Catherine D'Ignazio and Lauren Klein describe it.)

To get more familiar, we are going to begin by doing some background reading.

- First, please read [this FAQ](https://countlove.org/faq.html) from the CountLove website and the opening of [this blog post](https://www.tommyleung.com/countLove/index.htm). Based on the information in these pieces, why did the creators start collecting the CountLove data? Please answer in 2-3 sentences (3 points)

Although protests and demonstrations are effective at communicating with elected leaders, the facts tend to get lost, and are rarely recorded. Creating a factual record of ongoing demonstrations can make the data accessible, which can help citizens, journalists, and politicians. Historically documenting political protests and making the data readily available makes the events easier to understand in the context of longer term trends.

- Next, we would like you to read this [*New York Times* piece, which uses CountLove data](https://www.nytimes.com/interactive/2020/06/13/us/george-floyd-protests-cities-photos.html) (here's a [Google Doc version for anyone who gets paywalled](https://docs.google.com/document/d/1sdjFsA5csYuH4plNEEk7WXT77K5h5ZuyW05CBwYdk6A/edit?usp=sharing)), and which describes the Black Lives Matter protests that occurred in the summer of 2020. Please summarize the main point or argument of this article in 2-3 sentences (3 points)

This article shows the vastness of the Black Lives Matter movement in 2020. The support for the Black Lives Matter movement grew extremely rapidly compared to ever before. There were protests held in every single state and Washington DC, and these protests transcended boundaries of race and economic divide. 

Next, we're going to reflect about who collected this data, and what's actually inside it.

- Who collected and shared the CountLove data, and what do they do for a living? Please answer in 1-2 sentences(2 points)

Tommy Leung and Nathan Perkins collected and shared the CountLove data. They are engineers and scientists.

- As Klein and D'Ignazio remind us, when it comes to data, "what gets counted counts." What types of demonstrations does CountLove include in their data, and what types do they exclude? (3 points)

CountLove includes public displays that are not considered "regular business." This means that they do not include events such as historic reenactments, townhalls, political compaign rallies, or historic reenactments. Instead, they focus more on public displays of protest.

- How and where does CountLove get their data about the protests? Please answer in 2-3 sentences (2 points)

CountLove gets their data from crawling local news outlets, or primary sources. They search over 1600 local newspaper and television sites in the United States in search of keywords such as "march", "rally", "protest", or "demonstration". The information about each protest is then manually coded, including the number of attendees, the general topic of the protest, and the date that it occurred. 

- How does CountLove make their estimates about the number of people who attended a protest? What potential problems might arise from this method of estimation? Please answer in 3-4 sentences (4 points)

CountLove uses the most conservative estimates for their attendee counts. For example, if the word "dozens" is used, they will record 10, and if the word "hundreds" is used, they will record 100. This method may cause some problems because the recorded data could be much less than what actually occurred. However, I do think it would be better practice to round down instead of rounding up for the sake of accuracy. 

## While You Code: Critical Analysis & Reflection

- Reflection 1: Why do you think the mean is higher than the median? Which metric would you use in a report about this data, and why? Please answer in 2-3 sentences (2 points)

I think that the mean is higher than the median because of the amount of NA entries. I would probably use the mean instead of the median, because it seems that the mean would be closer to the average number of protest attendees in actuality.

- Reflection 2: Before actually calculating the number of protests that occurred in 2018, 2019, 2020, record your guesses for the following questions. (1 point)

  Guess: Do you think there were more protests in 2019 than in 2018? Why or why not? Please answer in 1 or 2 sentences
I think there may have been about an equal amount between the two years, because it is hard to think of major political events that happened at the time.

  Guess: Do you think there were more protests in 2020 than in 2019? Why or why not? Please answer in 1 or 2 sentences
I think that there were more protests in 2020 compared to 2019 because there was a lot of political unrest at the time regarding Black Lives Matter and Trump.

- Reflection 3: Does the change in the number of protests from 2018 to 2019 to 2020 surprise you? Why or why not? What do you think explains the fluctuation? Please answer in 1 or 2 sentences (2 points)
I was not really surprised by the change in tne number of protests between the years because it seems to reflect the political climate at the time.

- Reflection 4: What is the first and fourth most frequent category of protest? Do these frequencies align with your sense of the major protest movements in the U.S. in the last few years? Why or why not? (3 points)
The first and fourth most frequent categories of protest are Racial Injustice and Immigration. This makes sense because immigration reform and systemic racism have been extremely heavily talked about in the past few years.

## After You Code: Critical Analysis & Reflection

In the second chapter of *Data Feminism*, Klein and D'Ignazio describe 4 ways that data scientists can challenge power and take action:
> Taking action can itself take many forms, and in this chapter we offer four starting points:  
> (1) Collect: Compiling counterdata—in the face of missing data or institutional neglect—offers a powerful starting point as we see in the example of the DGEI, or in María Salguero’s femicide maps discussed in chapter 1.  
> (2) Analyze: Challenging power often requires demonstrating inequitable outcomes across groups, and new computational methods are being developed to audit opaque algorithms and hold institutions accountable.  
> (3) Imagine: We cannot only focus on inequitable outcomes, because then we will never get to the root cause of injustice. In order to truly dismantle power, we have to imagine our end point not as “fairness,” but as co-liberation.  
> (4) Teach: The identities of data scientists matter, so how might we engage and empower newcomers to the field in order to shift the demographics and cultivate the next generation of data feminists?  

- How does the CountLove project embody one or more of these 4 forms of challenging power? Please answer in at least 3-4 sentences (3 points)
The CountLove project embodies collection the most. They compiled interesting data that shows what the American people protest the most about, and got the numbers, dates, and locations of the demonstrations. This creates a powerful starting point when it comes to discussion about what changes that Americans are hoping for politically.

- What is the most interesting or surprising thing you learned from this analysis? Please answer in at least 2-3 sentences (2 points)
One interesting point was looking at the difference between the median and the mean, because they were very different from each other. In scenarios like this, it is important to try and calculate which one may be more accurate and avoid presenting an average that may not actually reflect the data well. 

- What is a kind of analysis that you would like to do or that would be interesting to do with the CountLove data that you don't have the time or skills to accomplish at this moment? Please answer in at least 2-3 sentences (2 points)
One analysis I would like to do with CountLove data would be to see the most common protest topics by state. Some states may feel more passionate about certain topics compared to others. 