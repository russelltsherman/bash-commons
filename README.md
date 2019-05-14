# Bash Commons

This repo contains a collection of Bash functions for handling common tasks
such as logging, assertions, string manipulation, and more.

## Testing

Every function should be tested:

* Automated tests are in the [test](/test) folder.

* We use [Bats](https://github.com/sstephenson/bats) as our unit test framework for Bash code. 
  
  Note: Bats is not well maintained, consider switching to the [bats-core](https://github.com/bats-core/bats-core)
  fork at some point (see [#150](https://github.com/sstephenson/bats/issues/150)).

* To build/rebuild the containers for testing
  `docker-compose build`

* To run all the tests: 
  `docker-compose up`.

* To run one test file: 
  `docker-compose run tests bats test/array.bats`.

* To leave the Docker container running so you can debug, explore, and interactively run bats: 
  `docker-compose run tests bash`.
