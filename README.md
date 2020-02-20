# README

<pre>
Implement a better News Reader for Hacker News using Rails.<br />
Get information from website: <a href="https://news.ycombinator.com/best">https://news.ycombinator.com/best</a>
</pre>

Configuration:

* Ruby version: 2.7

* Ruby on Rails: 6.0

* Support from gem: nokogiri || ruby-readability

* Frond end: HTML5/CSS/Bootstrap 4

* Services (job queues, cache servers, search engines, etc.)

* Demo:

<pre><a href="https://newest-reader.herokuapp.com/">https://newest-reader.herokuapp.com/</a></pre>

* Test suit available for test in helper.


* Deployment instructions
  <pre>
  - bundle install
  - rails db:migrate
  - rails assets:precompile
  - rails s
  - Go to <a href="https:/localhost:3000/">localhost:3000</a> to check result.

