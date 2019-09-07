# Galvanize Data Analytics Capstone
## Google My Business - Organic Performance Dashboard

## Abstract
The subject of this Data Analytics Capstone Project is an analysis of a large selection of Google My Business performance data within the healthcare category of home health & hospice. The impetus of the project focused around two areas (a problem and a question):

**Problem:** Performing historical batch analysis of multiple locations in Google My Business is difficult-to-impossible using traditional built-in tools, data exports, or dashboards.

**Question (For the Purpose of the Capstone Project):**
The question of interest for purposes of the assignment was whether there is a correlation between GMB listing ratings (on a scale of 0-5) and conversion rates. The hypothesis going into this research was that there would be a positive correlation between the two metrics.

## Introduction
The goal of the final dashboard was to create a central, easily navigable place for non-technical users to be able to evaluate home health care location’s performance in organic search (using the Google search engine). Several limitations and qualifications were determined early on, detailed below:
- **The dashboard must be usable for non-technical users:** Filters & controls should be simplified as much as possible and abstract away the need for technical know-how.
- **The dashboard must be deep and connected:** While the UI should be simple, the user must be able to drill down as deep as he/she should desire. Whenever searches are made, filters are set, or location subsets are clicked on, the entire dashboard should react and show data accordingly to avoid confusion for the user.
- **The user must be able to quickly navigate to their desired location(s) without friction:** Most users at the client-level will only care about locations at a specific level. For example, many users may only care about a single location’s performance, while others will only be concerned with the performance of a family of locations or a specific region. These users must be able to easily and quickly navigate to their desired scope and the entire dashboard should be just as usable for someone looking at only one location’s performance as someone looking at an entire state, region, or all locations.

In addition to these needs, I knew that users of the dashboard would care about seeing historical data, forecasting, and relative performance between locations. From this point, I developed a plan for exporting the desired data from Google My Business[^1], cleaning it, uploading it to a SQL server, and then creating visualizations and a dashboard for the data in Tableau.

## Methods
Before retrieving any data, some auditing of individual locations was done to see what insights could be drawn from individual data. This analysis was done through a combination of personal automations and API calls to various Google & SEO-related web services. (See Automations & API’s section as well as Appendices 2-A through 2-C).
This analysis determined that there was validity in doing a similar evaluation at a broader scale with a larger sample size. The rest of the research used a sample size of n=741 individual google my business listings for home health care and hospice locations, all owned by LHC Group, the largest home health care company in the United States. Data was only exportable from Google My Business in single data ranges, so 14 months of data had to be individually exported month-to-month and datasets needed to be joined from there. To accomplish this, each month’s data was cleaned in Excel (removing unnecessary columns, adding dates, and other miscellaneous cleaning activities using formulas learned in the Galvanize course).
Once the data was cleaned, the command line & terminal were used to combine the CSV files (See Appendix 1-A) into one consistent data source. From this point, a loading query was written and data was loaded into a person SQL server in PostgressSQL. Within Postgress, some columns were split and data types (such as dates & address fields) were reworked with the CAST feature. Initially, the data was split up into a normalized database, but it was ultimately determined that, for the data to be best used in Tableau, having the data in a single exportable table worked best for further analysis in this specific situation. (Note that later on in the project, it was determined that further work could have been done in SQL to divide the locations into families in a way that was more effective than Tableau’s tools. This was unable to be done due to time constraints of the project, but I will likely to back to do so in the near future).
After this data was split appropriately, it was exported in CSV form and imported into Tableau. Here, the majority of the work took place. Address fields were further split to be worked into map views (originally all addresses were a single column), and many new calculated fields were created to facilitate parameter controls, better filtering, and easier-to-understand metrics for the user (See Appendix 3-A through 3-C). From this point, visualizations, parameter controls, filters, and other user-facing features were compiled into one dashboard based off of the user needs detailed in the Introduction.

## Results
### Dashboard Reception
The final dashboard came together in a way that was fluid and functional, though still has significant areas of opportunities. The dashboard was presented to the internal team for LHC group & is now used in monthly report & KPI forecasting to great effect. Reception has been very positive, and the dashboard has provided a quick way to retrieve data for listings at any scope and predict performance in the coming months.

### Capstone Question: Relationship Between Ratings & Conversion Rates
The Capstone question was answered with mixed success. What the visualizations ultimately showed was that there was not a correlation between listing ratings and casual conversion metrics (i.e. visiting website or calling phone number). However, there was a noticeable trend showing that locations with higher ratings had much higher conversion rates for Searchers that clicked for directions in Google Maps. This indicated that the credibility (or lack thereof) of online rating may have been a barrier or benefit to listings with low or high ratings respectively. It is difficulty to state a definitely correlation without a deeper analysis of data and sample reliability (See the Data Reliability of the Discussion section), but these findings are notably in the direction of the hypothesis.

## Discussion
### Limitations & Issues in Project
**Limited Metrics Within Data:** Within the Google My Business data, conclusions were only able to be drawn and connected within the conversion and organic search data available within that source. The significant amount of data cleaning & combining needed to produce workable data meant there wasn’t enough time during the project to combine the data with other valuable data sources
**Some Unclear Visualizations:** While great effort was put into creating a fluid, responsive, easy-to-use, and interactive dashboard, many improvements could be made in creating clearer visualizations. In particular, the dashboard visualization that shows the relationship between location ratings and organic conversions. More time and attention could be paid to fleshing out this visualization in a way that shows the answer to the Capstone Question clearly to someone without technical knowledge.
**Tableau Formatting Limitations:** There were several limitations with formatting & styling the dashboard that made it difficult to create seamless experience for the user. For example, while it was possible to add a custom branded color palette with XML, it was impossible to use client-branded custom typefaces (as these fonts didn’t translate to the web version of the dashboard). There were also performance and latency issues with map navigation and mobile optimization. Formatting and adding headers to tables inserted in dashboards revealed several hard road-blocks. Finally, because there were so many visual flourishes, custom headers, and floating objects, it proved difficult-to-impossible to make the dashboard size automatically (As too many elements got pushed around at different window sizes), hurting usability on mobile devices or narrow windows.
**Limited Historical Data:** While the amount of data retrieved for the project (about 14 months) worked well for creating visualizations and doing historical analysis, it wasn’t a large enough sample to effectively consider seasonality on a larger scale. Adding 2-3 years of historical data would greatly improve the dashboard’s forecasting accuracy.
**SQL Use for Capstone:** Due to time constraints, there was limited SQL use for processing data in the final capstone analysis (though data was fully loaded into the SQL database & some queries were made).

### Opportunities for Future Research
**Linking Additional Data Sources:** Though many exports were combined to achieve an acceptable sample of historical data, these were largely from the same same of Google My Business Insights data. However, the inclusion of location data in this source will allow it to be easily linked to more location-based data sources to provide more meaningful correlations. For example, demographic data (age, income, nationality, etc) would be very useful to evaluate external indicators of a home healthcare location’s success in organic search.
**Improved Visualizations:** Admittedly, the project focused more around solving a real-world problem (the inability to do historical analysis in one easy-to-use place for many GMB locations), the dashboard and visualizations only focused secondarily on answer the capstone question. More time and effort could be put into simplifying and adding additional visualizations to more clearly answer the proposed question.
**Improve Data Reliability:** The current sample provided excellent data, but research didn’t include an evaluation of data or sample reliability, so it was not possible to reference the Cronbach’s Alpha, P-value, or other metrics to indicate whether the sample was representative of a larger population and whether the results showed an objective correlation between measured data points.

## Skills Used In Capstone Project
### Tableau
**Calculated Fields:** Many instances of using calculated fields for new metrics & parameter integrations (See Appendices 3-A through 3-C)
**Parameters:** Use of parameters for chart control, custom search, custom styling, map control, and more features. See Appendix 3-A for example of calculated field to search via location name, family, city, or state to be controlled via custom parameter.
**Visualizations & Dashboards:** Many visualizations were created and refined to form the final dashboard. Calculated fields & parameters were used to control metrics used in visualizations for more intuitive use of the dashboard for non-technical users.
**Groups & Sets:** Groups & sets were used in tandem with calculated fields & custom filters to classify the locations into families[^2]
**Maps:** The map component (including nicely formatted & dynamic tooltips) was the starting place for my Capstone dashboard. The map implemented is dynamic and will react to any interaction in the dashboard automatically. Focus was put on keeping it easy-to-read (not too many metrics + an accessible legend) but full-featured.
**Forecasting:** Forecasting was thoroughly implemented in the project & dashboard. Instead of creating various forecasts for different metrics, I created a calculated field & parameter to dynamically switch one forecast to measure different key metrics based on user selection.
**Formatting & Design:** There was significant effort put into the aesthetic of the dashboard (including editing in a custom color palette via XML) via imagery, color use, graphics, typography, and other visual flourishes. However, the UI of the dashboard is ultimately secondary to the User Experience. Having a good UX was the primary focus of the dashboard, so great effort was put into having each element of it tied to the reaction of the user, so simple things like clicking the name of a location, inputting a search, or interacting with the map will change every single visualization in the dashboard. The dashboard will also use dynamic text displays to show the user what is being measured and what scope they are in, so no one is lost or confused by accidentally clicking into a location or selecting a metric.
**JOINS & Other:** Tableau’s built in JOIN functionality & ability to intelligently split columns and assign data types were both used extensively to transform the data into usable metrics & create columns of usable location data for the map view.

### SQL
SQL was used to load data into PostgressSQL, create normalized tables based off a primary key (split between conversion data, search data, and location data), and some splitting of columns and casting data types (See Appendix 4-B). Ultimately, SQL was used a bit less in the capstone component of class than I would have liked, as it ended up being best to import everything as one table into Tableau and work from there. From here, instead of doing a join for the data in Tableau each month to update the dashboard, I plan to create an automation that will call Google My Business’ API, load the data into a SQL server, transform columns as needed, create normalized tables, and use that as an automatically updated database for further analysis. (See Appendix 4-A through 4-B for examples)
### Excel
Excel was used significantly throughout the process in the data cleaning potion of the assignment. Specifically, date information was added via excel, some needed columns were split up via functions taught in class, duplicates were removed, and a primary key for the data was established. This was an integral step in getting reliable historical data before the different CSVs (for different months) were combined & loaded into the SQL server & Tableau.
### Automation & APIs
- Automating of GMB insight downloads for historical periods retrieved through use of Keyboard Maestro.[^3]
- Google My Business & Analytics API calls use for retrieval of batch data. Calls were made through use of the Shortcuts App[^4], a powerful automation tool with a strong feature-set for personal web requests. This included 100% personally crafted web auditing automations with 400+ individual actions and over 15 individual API calls from various web services. This included processing of JSON results & navigation of dictionaries. (See Appendix 2-B for API call examples)
- Example site audit automation I built to do a qualitative analysis of listings using various API calls:


### Terminal
- Uploading and management of capstone files on GitHub server
- Terminal commands used to combine & split CSV data sources into one central file
- Some use of Google’s PageSpeed Lighthouse terminal integration for initial performance benchmarking of locations[^5]
### Markdown
Markdown was used thoroughly not only in every submitted assignment in the course (for readability), but also in the use of correct header structure, bolding, italicizing, code blocks, footnotes, linking, and more throughout this document. In addition to extensive use of Markdown, an HTML version of this document was created for improved formatting, navigation, and inclusion of rich media.

## Follow-Up Goals
- The Tableau Dashboard has already been presented and integrated into regular reporting for the client, to great success. The dashboard was built so that it requires minimal effort to add new performance data each month for up-do-date performance metrics & improved forecasting as the amount of historical data grows
- Improvements to the dashboard and research into my Capstone question will be made based off of the issues & opportunities discussed previously in this document
- SQL use will be incorporated into my regular data analysis activities (For example, I am now working on an automation to make API calls to Google Analytics & CMS data sources, automatically upload that data to a SQL server, clean & process the data based on pre-made queries, and plug into a Google Data Studio dashboard)

## Appendix – Code Examples
_Note that API calls have had some information (such as URL targets & API keys) removed for anonymization of proprietary, costly, or otherwise sensitive data. Not all formulas, API calls, & queries used in the Capstone project are detailed (for example, some SQL queries were not saved after use)._

### Terminal Commands
**(1-A) Combining CSV Data:**
```	cd /Desktop/GMB_Captsone_Project

	cat “GMB insights-2018-05.csv” “GMB insights-2018-06.csv” “GMB insights-2018-07.csv” "GMB insights-2018-08.csv" "GMB insights-2018-09.csv" "GMB insights-2018-10.csv" "GMB insights-2018-11.csv" "GMB insights-2018-12.csv" "GMB insights-2019-01.csv" "GMB insights-2019-02.csv" "GMB insights-2019-03.csv" "GMB insights-2019-04.csv" "GMB insights-2019-05.csv" > GMB_Insights_1_Year.csv
```

### API Call Examples
**(2-A) GET Request for Google Pagespeed**
```https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=https://lhcgroup.com/locations/christus-homecare-of-tyler/&strategy=mobile&responseCode=integer&ruleGroups.(AIzaSyAPC0wrtVAzsAT9p9f5y_jshMExyLmwfZs).score=integer&key=[API-KEY-HERE]
```

**(2-B) GET Request Sample for Google My Business Data**
```https://mybusiness.googleapis.com/$discovery/rest?version=v4
```

**(2-C) GET Request for SEMRush Site Auditing**
```https://api.semrush.com/?type=domain\_organic&key=[APIKEYHERE]&display\_limit=100&export\_columns=Ph,Po,Nq,Tg,Co,Ur&domain=&display\_sort=nq\_desc&database=us
```

### Tableau Formulas
**(3-A) Location Search Filter Controlled by Custom Parameter**
```CONTAINS(([State]),[Search Box])
OR
CONTAINS(([City]),[Search Box])
OR
CONTAINS(([Business name]),[Search Box])
OR
CONTAINS(([Families]),[Search Box])
```

**(3-B) View Filter to Switch Table Data Based on Parameter Control**
```CASE [Parameters].[Filter On]
WHEN "Conversion Rate" THEN [Conversion Rate]
WHEN "Total Actions" THEN [Total actions]
WHEN "Total Searches" then [Total searches]
END
```

**(3-C) Example of Formula to Combine Data Sources into Custom Metrics
	(([Search views]/100)+([Total searches]/100)+([Discovery searches]/100)/3)

**(3-D) Custom XML File for Adding Client-Branded Color Palette to Tableau**
```	<?xml version='1.0'?>

	<workbook>
	  <preferences>
	    <color-palette name="LHC Branded" type="regular" >
	      <color>#97b7dc</color>
	      <color>#deddeb</color>
	      <color>#ffb399</color>
	      <color>#f7d97e</color>
	    </color-palette>
	  </preferences>
	</workbook>
```

### SQL Queries
**(4-A) Loading Query for PostgressSQL**
```	BEGIN;

	CREATE SCHEMA IF NOT EXISTS da_gmb;

	CREATE TABLE da_gmb.listings (
	        "store code" VARCHAR PRIMARY KEY,
	        "date" date,
	        "Business name" VARCHAR,
	        Adress VARCHAR,
	        "Overall rating" INTEGER,
	        "Total searches" INTEGER,
	        "Direct searches" INTEGER,
	        "Discovery searches" INTEGER,
	        "Total views" INTEGER,
	        "Search views" INTEGER,
	        "Maps views" INTEGER,
	        "Total actions" INTEGER,
	        "Website actions" INTEGER,
	        "Directions actions" INTEGER,
	        "Phone call actions" INTEGER,
	        );

	DELETE FROM da_gmb.listings;

	-- UPDATE THIS PATH:
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-1-2019.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-2-2019.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-3-2019.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-4-2019.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-5-2019.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-5-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-6-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-7-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-8-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-9-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-10-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-11-2018.csv'
	WITH DELIMITER ',' CSV;
	COPY da_gmb.gmb_listings FROM '/Users/micahowens/Desktop/GMB Captsone Project/GMB insights-12-2018.csv'
	WITH DELIMITER ',' CSV;

	COMMIT;
	```

**(4-B) Sample Query for Extracting Only Conversion Info & Primary Key from Source for Normalized Data**
```	SELECT
		"date",
		extract('year' from "date") as extract_Year,
		extract('month' from "date") as extract_Month,
		"store code",
		"Total actions",
		"Website actions",
		"Directions actions",
		"Phone call actions",

	FROM da_gmb.listings
```

[^1]:	Google My Business is Google’s management tool for business’s that have physical locations & information to show in organic search (The callouts with address, website, reviews, and other information found at the top of Google search)

[^2]:	“Families” are sets of locations under the same name & owner, and are often analyzed together

[^3]:	[https://www.keyboardmaestro.com/main/#Overview](https://www.keyboardmaestro.com/main/#Overview)

[^4]:	[https://apps.apple.com/us/app/shortcuts/id915249334](https://apps.apple.com/us/app/shortcuts/id915249334)

[^5]:	[https://developers.google.com/web/tools/lighthouse/#cli](https://developers.google.com/web/tools/lighthouse/#cli)
