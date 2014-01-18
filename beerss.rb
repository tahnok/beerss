#!/usr/bin/env ruby
require 'simple-rss'
require 'beeminder'
require 'open-uri'
require 'yaml'

config = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), 'config.yml'))

bee = Beeminder::User.new(config['token'])
goal = bee.goal(config['goal_slug'])
datapoints = goal.datapoints
latest_datapoint = datapoints.max_by(&:timestamp)

blog = SimpleRSS.parse open(config['blog_url'])
latest_post = blog.items.max_by(&:published)

if latest_post.link != latest_datapoint.comment
  new_datapoint = Beeminder::Datapoint.new(value: 1, comment: latest_post.link)
  goal.add(new_datapoint)
  puts "Added new datapoint for #{latest_post.link}"
else
  puts "no new posts"
end
