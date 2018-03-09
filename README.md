# Stripe Easy Donations

This is a simple Rails app that implements taking credit card payments.

I built this initially over a couple of evenings while I was in Uganda and trying to quickly develop a way for people to contribute to the fundraising for a wedding. It was created with [Thoughtbot's suspenders](https://github.com/thoughtbot/suspenders)

## Configuaration

There are two major points where you can change the content to be whatever you want.

For the list of items on the donations page, you can find them in `app/data/selections` and their images in `app/assets/images`

For the content, look in in `config/locales/en.yml` there's more content that's just written into the templates themselves. Eventually I will probably switch the rest over... depends how many times I re-use this thing.

## Styles

Styles are ultra minimal. The goal was to spend as little time as possible on styling and css. It's relatively responsive at least.

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
