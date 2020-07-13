# ruby-template

This repo was created from a Minimal Ruby template from github user @deciduously.


## Dependencies

* [Ruby](https://www.ruby-lang.org/en/).  Written with version [2.7.0](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/) - *[docs](https://docs.ruby-lang.org/en/2.7.0/)*.

## Usage

To install dependencies, run `gem install bundler && bundle install`.
Run `bundle exec rake` to run the tests.
Run `bundle exec rake run` to run the program.

This program has been created with the following assumptions from the MYOB challenge

  - Player 1 is X and always goes first
  - Player 2 is O and always goes second
  - A player wins when all fields in a column are taken by the player
  - A player wins when all fields in a row are taken by the player
  - A player wins when all fields in a diagonal are taken by the player
  - The game is drawn when all fields are taken on the board and there is no winner


