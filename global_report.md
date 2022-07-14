Global Report on Democracy’s Covariates
================
David I. Crabtree
2022-07-06

-   [Origins of Democracy: An Ongoing
    Debate](#origins-of-democracy-an-ongoing-debate)
-   [Data Sources](#data-sources)
-   [Democracy and GDP, GDP per capita, and GINI
    Scores](#democracy-and-gdp-gdp-per-capita-and-gini-scores)
-   [Democracy and Literacy Rates](#democracy-and-literacy-rates)
-   [Democracy and Women in
    Legislatures](#democracy-and-women-in-legislatures)
-   [Future Research](#future-research)

## Origins of Democracy: An Ongoing Debate

### Introduction

Why are some states democratic while others are authoritarian?
Comparative political scientists have been trying to answer this
question for as long as the field has existed. The factors commonly used
to explain the emergence and persistence of democracy fit into one of
three categories: institutional factors, cultural factors, and economic
factors. In this report, I will broadly explore facets from each of
these areas and how they relate with the health of democracy. While this
report analyzes these relationships at the global level, I also
generated individualized country reports for every country for which
data was available. These can be found in the *reports* folder of the
project.

I proceed by broadly describing the data I will be using throughout the
report. I then turn to exploring the relationship of GDP, GDP per
capita, and GINI coefficients with democracy. Next, I look at the
correlation between literacy rates and democracy scores. Finally, I
examine the proportion of women in national legislatures alongside
democracy scores.

## Data Sources

To operationalize democratic quality, I downloaded the [FreedomHouse
Country & Territory
Ratings](https://freedomhouse.org/report/freedom-world). The dataset has
measurements of 206 country’s political rights and civil liberties since
1973. FreedomHouse variables use a non-intuitive coding scheme where
higher ratings indicate less democratic qualities and lower ratings
indicate more. Therefore, I have recoded all variables so that low
ratings correspond to low democracy indicators, and high ratings with
high democracy indicators. Thus, the `political rights` variable ranges
from 1-7, with lower scores indicating unfair or non-existant electoral
processes, unaccountable officials, closed political systems, etc.
Likewise, the `civil liberties` variable ranges from 1-7 and covers a
wide metric of individual freedoms, like: free religious expression,
protection for labor organization, due process rights, property
guarantees, etc. I combine these scores into an overall *democracy*
rating, `demscore`, which ranges from 2-14.

FreedomHouse generally considers countries to be “free” when they have
both high civil liberty scores **and** high political rights scores. The
below chart highlights the rough idea, although it’s outdated by current
metrics since the scores no longer range to 40 and 60.

![](https://freedomhouse.org/sites/default/files/2020-02/FITW%20tables_0.jpg)

All other substantive data, including GDP, literacy rates, and
proportion of women in legislatures, comes from the [World
Bank](https://data.worldbank.org/indicator). These metrics are
straightforward, so I will refrain from explaining them here.

Lastly, I imported a [basic
dataset](https://www.kaggle.com/datasets/andradaolteanu/country-mapping-iso-continent-region?resource=download)
that just assigns every country its proper continent and region in the
world, since these may be useful for breaking up the global analysis
into more digestible chunks.

## Democracy and GDP, GDP per capita, and GINI Scores

![](global_report_files/figure-gfm/Democracy%20x%20Economics-1.png)<!-- -->

From a first cut look at the data on democracy scores and GDP, there
doesn’t appear to be a strong relationship at first glance, with most
observations having very low GDPs. However, this is a bad representation
of the relationship because it does not account for the wide variation
in GDP - particularly over time. The median GDP for all countries at all
time periods covered is 1.1241542^{10} - notably smaller than the mean
GDP of 2.1301988^{11}. I attempt to account for this by lowering the
maximum scale of the graph to $50 billion and breaking the analysis into
decades.

![](global_report_files/figure-gfm/Dem%20x%20Econ%20by%20Decade-1.png)<!-- -->

This graph yields interesting results: the relationship between
democracy and GDP seems to vary over time, with a potentially positive
relaitonship in the 70s and 80s, but a more ambivalent or negative
relationship in the 2000s and 2010s. Because some effects still may be
confounded by time, I select a single year (the most recent in the
dataset) to examine the relationship.

![](global_report_files/figure-gfm/Dem%20x%20Econ%202019-1.png)<!-- -->

The trend becomes more clear, although it is unexpected and contrasts
with the expectation that richer countries will have higher democracy
scores. Because GDP may not be the best measurement of the health and
development of a country’s economy, I turn to GDP per Capita next.

![](global_report_files/figure-gfm/Dem%20x%20GDP%20per%20Capita-1.png)<!-- -->![](global_report_files/figure-gfm/Dem%20x%20GDP%20per%20Capita-2.png)<!-- -->

While the relationship seems more foundationally positive now - at least
at the extremes, the regression lines are still mostly flat.
Essentially, it looks like that there’s a lot of poorer countries spread
across the lower democracy scores, not in any particularly linear
fashion.

As a final potential factor interacting with GDP, I examine the impact
of a country’s geo-location.

![](global_report_files/figure-gfm/Dem%20x%20GDP%20per%20Capita%20by%20Continent-1.png)<!-- -->

While the relationship remains inherently flat for most democracy
scores, it seems clear that there is a relationship between continent
and democracy score, as well as GDP per Capita. Specifically, countries
in Europe seem to have both high democracy scores and GDP per Capitas,
on average. Likewise, the regression line for Africa predicts GDP per
capitas to be below $10k even for the highest democracy ratings, whereas
those for Europe are predicted around $40k for the highest democracy
rating.

To conclude the section on economic relationships, I examine the
relationship between democracy and inequality.

![](global_report_files/figure-gfm/Dem%20x%20Inequality-1.png)<!-- -->![](global_report_files/figure-gfm/Dem%20x%20Inequality-2.png)<!-- -->

The smooth line shows what seems to be either a positive or inverse-u
shaped trend, consistent with findings from Acemoglu and Robinson
(2005), who theorize that particularly low or high levels of inequality
are bad for democracy. At low levels, they argue that citizens are not
sufficiently incentivized to disrupt the status quo of authoritarian
politics, and at high levels, they argue the political elite have
economic reasons to suppress democratic reformers. At middling levels,
as seen in the graph where inequality spikes with democracy, there is
just enough incentive for citizens to revolt and elites to grant
concessions in the form of democratic institutions.

The continents scatterplot highlights general trends in inequality: Of
democracies, those in the Americas seem more likely to have higher
inequality, while those in Europe seem more likely to have less.
Countries in Asia seem more likely to have lower levels of inequality as
well as low democracy ratings.

## Democracy and Literacy Rates

![](global_report_files/figure-gfm/Dem%20x%20Literacy%20Rates-1.png)<!-- -->

The global relationship between literacy rates and democracy appears to
be rather static and unnoticeable for more autocratic countries, but
when democracy scores improve beyond roughly 7, higher literacy rates
start to coincide with higher levels of democracy, on average. In other
words, whether a relationship exists may depend on the current level of
democracy in a given country. We can also look at this relationship
across continents.

![](global_report_files/figure-gfm/Dem%20x%20Literacy%20Rates%20by%20Continent-1.png)<!-- -->

The scatterplot highlights some interesting trends: countries in Asia
are notably clustered in the upper left quadrant, which is countries
with high literacy scores **and** low democracy ratings. Why are Asian
countries specifically apparently likely to fall into this category?
Future research could examine this. Countries in the Americas are
roughly centered in the upper right quadrant: with high literacy rates
and high democracy scores. Most countries squarely in the lower
quadrants (indicating low literacy rates) are countries in Africa.

## Democracy and Women in Legislatures

![](global_report_files/figure-gfm/Dem%20x%20Women%20in%20Legislatures-1.png)<!-- -->![](global_report_files/figure-gfm/Dem%20x%20Women%20in%20Legislatures-2.png)<!-- -->![](global_report_files/figure-gfm/Dem%20x%20Women%20in%20Legislatures-3.png)<!-- -->

The figures over time highlight that the proportion of women in
legislatures has increased over time for *all* regime types - not just
democracies. Thus, it may not be a reliable indicator of whether or not
a country is becoming more democratic. Still, the regression lines show
a generally positive trend, and countries in - for instance - Europe,
have both a notably higher democracy score *and* proportion of women in
their legislatures than countries in - for instance - Asia.

## Future Research

The models show weak but generally expected relationships between the
covariates and democracy. Future research should explore these
relationships with formal statistical models. Refer to attached country
profiles to see each country compares in its democracy ratings as well
as how the relationship between income and democracy functions on a
country-level basis.
