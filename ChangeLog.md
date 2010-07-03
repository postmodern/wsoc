### 0.1.3 / 2010-07-02

* Migrated off of Hoe and to Jeweler.
* Manage all development dependencies with Bundler.
* Removed the dependencey on nokogiri.
* Upgraded from json to json_pure ~> 1.4.0.
* Upgraded to sinatra ~> 1.0.
* Switched to markdown formatted YARD documentation.
* Added a meta-refresh/redirect obstacle to the course (thanks zapnap).

### 0.1.2 / 2010-01-10

* Emergency fix for a typo that only effected Ruby 1.9.1.

### 0.1.1 / 2010-01-06

* Added WSOC::Specs.metadata.
* Added WSOC::Specs.config.
* Added {WSOC::Helpers::Authentication}.
* Added a failing link to `/course/remote/start.html` with a bad TLD.
* Added a failing link to `/course/remote/start.html` with the bad
  IP address +191.255.0.0+.
* Added `/course/auth` for testing spidering of HTTP Basic
  Auth protected pages.
  * Added auth store information to the metadata within the specs.

### 0.1.0 / 2010-01-02

* Initial release:
  * Written as a Sinatra application.
  * Provides Specs for the expected behavior of a web spider for every link
    in the Obstacle Course.
  * Provides an Obstacle Course containing:
    * Empty links.
    * Circular links.
    * Links with relative-paths.
    * Links with absolute-paths.
    * Remote links.
    * `javascript:` links.
    * Links within +frameset+ and +iframe+ tags.
    * HTTP 300, 301, 302, 303 and 307 Redirects.

