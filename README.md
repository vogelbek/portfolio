# README
This rails project is intended to become a developer's portfolio at the end of the quarter as part of the University of Washington Ruby Certificate course. Please stay tuned for future awesomeness.

## Setup

`git clone https://github.com/vogelbek/portfolio.git`

`bundle install`

`rake db:migrate`

`rails server`

## Testing

The current CI status of this project is:
[![Build Status](https://travis-ci.org/vogelbek/portfolio.png?branch=master)](https://travis-ci.org/vogelbek/portfolio)

This project is testing with MiniTest, Capybara and PhantomJS. Here is an example of a test passing using

`rake minitest:all TESTOPTS='--verbose'`

![example test](https://raw2.github.com/vogelbek/portfolio/master/public/MiniTest%20specs%20passing.jpg)
