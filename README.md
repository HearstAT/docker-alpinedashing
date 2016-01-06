# Dashing
Run [Dashing](http://dashing.io/) in a [Docker](http://docker.io/) container.

Link: [hearstat/alpine-dashing](https://registry.hub.docker.com/u/hearstat/alpine-dashing/)

## Dockerfiles
Two versions are current supported.

* Out of the box Dashing w/ Font Awesome 3.2.1 [DockerFile](https://github.com/HearstAT/docker-alpinedashing/blob/master/3.2.1/Dockerfile)
* Modified version of Dashing running Font Awesome 4.5 [Dockerfile](https://github.com/HearstAT/docker-alpinedashing/blob/master/4.5/Dockerfile)

## Supported Widgets
Widgets that support Font Awesome 4.5 config and Environment being set via the dashing.conf mentioned below.
* [Docker Hub Widget](https://gist.github.com/TheFynx/0099db153674bf83e397)
* [Github New Feed](https://gist.github.com/TheFynx/21d51c76901e3ab3d405)
* [Jenkins Build Status](https://gist.github.com/TheFynx/b5f2e76cd44d8c8d1619)
* [Pagerduty](https://gist.github.com/TheFynx/8bf7f7038839742b735c)

## Run

    docker run -d -p 8080:3030 hearstat/alpine-dashing


And point your browser to [http://localhost:8080/](http://localhost:8080/).


## Configuration

### Dashboards
To provide a custom dashboard, use container volume **/dashing/dashboards**:


    docker run -v=/path/to/dashboards:/dashing/dashboards -d -p 8080:3030 hearstat/alpine-dashing


(*Don't forget to also provide the layout.erb*)

### Jobs
To provide custom jobs, use container volume **/dashing/jobs**:


   docker run -v=/my/cool/job:/dashing/jobs -d -p 8080:3030 hearstat/alpine-dashing


### Widgets
To install custom widgets supply the gist IDs via yaml file:

widgets.yml
```yaml
- 47b71cb4920fb6df1a45 #Docker Hub Widget
- 7a346fa63e2aa5b56588 #Github News Feed
```

    docker run -v=/path/to/widgets.yml:/dashing/widgets.yml -d -p 8080:3030 hearstat/alpine-dashing


Also you can use local custom widgets

    docker run -v=/my/cool/widgets:/widgets -d -p 8080:3030 hearstat/alpine-dashing


### Gems
To install gems, just mount a Gemfile. Though it's recommended this is you baseline gems

(*you can remove the newrelic_api if you choose to provide your own widgets.yml without newrelic*)

Gemfile
```ruby
source 'https://rubygems.org'

gem 'dashing'
gem 'faraday'
gem 'nokogiri'
gem 'mechanize'
```

    docker run -d -v=/path/to/Gemfile:/dashing/Gemfile -p 8080:3030 hearstat/alpine-dashing


### Public (favicon, 404)
To provide custom 404 and favicon, use container volume **/dashing/public**.

### Configuration File
The configuration file `config.ru` is available on volume */dashing/config*.

Edit this file to change your API key, to add authentication and more.

The configuration file `dashing.conf` is also available in the same location and is sourced at start up.

Edit/Add to this file for environment variables as needed for widget config.
