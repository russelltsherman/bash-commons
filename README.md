# Bash Commons

This repo contains a collection of Bash functions for handling common tasks
such as logging, assertions, string manipulation, and more.

## Install

```bash
git clone https://github.com/unionpos/bash-commons.git /opt/union
```

## Importing modules

You can use the `source` command to "import" the modules you need and use them in your script:

```bash
source /opt/union/bash-commons/lib/log.sh
```

This will make all the functions within that module available in your code:

```bash
log_info "Hello, World!"
```

## Available modules

Here's an overview of the modules available in `bash-commons`:

* `array.sh`: Helpers for working with Bash arrays, such as checking if an array contains an element, or joining an
  array into a string with a delimiter between elements.

* `assert.sh`: Assertions that check a condition and exit if the condition is not met, such as asserting a variable is
  not empty or that an expected app is installed. Useful for defensive programming.

* `log.sh`: A collection of logging helpers that write logs to `stderr` with log levels (INFO, WARN, ERROR) and
  timestamps.

* `string.sh`: A collection of string manipulation functions, such as checking if a string contains specific text,
  stripping prefixes, and stripping suffixes.


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
