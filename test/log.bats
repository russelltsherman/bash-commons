#!/usr/bin/env bats

export LOG_VERBOSITY=6

source "$BATS_TEST_DIRNAME/../lib/log.sh"
load "test-helper"

@test "log_always string" {
  run log_always "Hello, World"
  assert_success
  assert_output_regex "^.*Hello, World$"
}

@test "log_debug string" {
  run log_debug "Hello, World"
  assert_success
  assert_output_regex "^.*[DEBUG].*Hello, World$"
}

@test "log_info string" {
  run log_info "Hello, World"
  assert_success
  assert_output_regex "^.*[INFO].*Hello, World$"
}

@test "log_notice string" {
  run log_notice "Hello, World"
  assert_success
  assert_output_regex "^.*[NOTICE].*Hello, World$"
}

@test "log_warning string" {
  run log_warning "Hello, World"
  assert_success
  assert_output_regex "^.*[WARNING].*Hello, World$"
}

@test "log_error string" {
  run log_error "Hello, World"
  assert_success
  assert_output_regex "^.*[ERROR].*Hello, World$"
}

@test "log_fatal string" {
  run log_fatal "Hello, World"
  assert_success
  assert_output_regex "^.*[FATAL].*Hello, World$"
}

