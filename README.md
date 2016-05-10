# Identity-dashboard

An admin dashboard for the Identity project.

## Getting Started Locally

1. Make sure Postgres and Redis are running.  For example, on OS X:

    $ brew services start redis postgres

1. Run the following command to set up the environment:

    $ bin/setup

This command copies sample configuration files, installs required gems
and sets up the database.

1. Run the app server with:

    $ foreman start

## Running Tests

To run all the tests:

    $ bundle exec rspec

See RSpec [docs](https://relishapp.com/rspec/rspec-core/docs/command-line) for
more information.

## License

[The project is in the public domain](LICENSE.md), and all contributions will also be released in the public domain. By submitting a pull request, you are agreeing to waive all rights to your contribution under the terms of the [CC0 Public Domain Dedication](http://creativecommons.org/publicdomain/zero/1.0/).

This project constitutes an original work of the United States Government.
