# BeeRSS

This is a simple ruby script that will update a beeminder goal based on posts from an RSS feed

It works by checking to see if the comment on the most recent matches the url of the latest blog post

## Usage

 1. Move config.exmple.yml to config.yml ( `cp config.example.yml config.yml` )
 2. Replace the token line with your [beeminder token](https://www.beeminder.com/api/v1/auth_token.json)
 3. Replace the blog URL with the url of your blog
 4. Replace goal_slug with [slug](http://www.rubydoc.info/github/beeminder/beeminder-gem/master/Beeminder/Goal:slug) of your goal
 5. run `beerss.rb`

Note: If you aren't starting from a fresh goal, you should edit your most recent beeminder datapoint's comment to be the url of your last blog post

### With cron

I've setup cron to run this scrip every few hours when I'd normally be posting

 1. `crontab -e`
 2. Put `0 10,18,22 * * * /path/to/beerss/beerss.rb`

## License

MIT
