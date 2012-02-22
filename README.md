# Kodachi

Kodachi is a Sinatra-based image processing interface that is intended to use S3 and Heroku. This project is under development so please do not use this til it gets stable!

## Set up on Heroku

checkout the repo to your local.

```
$ git clone git://github.com/yuki24/kodachi.git
$ heroku create -s cedar your_app_name
$ git push heroku master
```

And add these config parameters.

```
$ heroku config:add S3_ACCESS_KEY=YOUR_ACCESS_KEY
$ heroku config:add S3_SECRET_KEY=YOUR_SECRET_KEY
$ heroku config:add S3_BUCKET=YOUR_BUCKET
```

Then try to open the app. enjoy!

## Combination of Kodachi and CDN
will be written later.

## TODO

* Write Rspec examples
* Travis-ci integration

## Contributing to rightchoice

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Yuki Nishijima. See LICENSE.md for further details.
