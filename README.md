# Result Scrapping
This is a project that I undertook to perform an analysis on my classmates results, to find out each person's marks, their ranks and the fall and pass rate of our class.

## Solution
The first thing that came in my mind to scrape a website which uses server side rendering was to use [Selenium](https://www.selenium.dev). Selenium is an open-source automation testing tool that supports several scripting languages like Python. <br> 
I used Selenium to scrape the results one by one by feeding the USN's to the input fields, but there was a catch. the website had a captcha code to prevent bots from scrapping. I was still new to this and came up with a solution that required semi human intervention. <br>
The selenium code that I wrote would extract the Captcha code image and render it inside the custom html page running locally on my system, I would then enter the Captcha code which will be extracted and dumped into the inputs of the website captcha. <br>
As the selenium keeps extracting all the results into a csv file, I use it to import that same data inside a database to run various sql queries to analyise the data. The system could be improved but it was just a project I came up with on a whim and wanted to give it a go.
