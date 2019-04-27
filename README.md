# Web-scraper

A simple back-end website scraper using Ruby to fetch the source code. 

## Introduction
- You can put in the website that you would like to check as well as the keyword that you are looking for. 
- You can setup to have an alert email to be sent to you if your desired keyword is found. 
- You can also set time intervel that you would like to refresh the website. 

## Installation
To refresh every 120 seconds
```sh
$ while :; do ruby scraper.rb; sleep 120; done
```
## Technologies Used
- open-uri
- mail

