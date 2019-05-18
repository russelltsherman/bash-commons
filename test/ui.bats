#!/usr/bin/env bats

source "$BATS_TEST_DIRNAME/../lib/ui.sh"
load "test-helper"

@test "ui_action string" {
  run ui_action "Hello, World"
  assert_success
  assert_output_regex "^.*⇒.*Hello, World ...$"
}

@test "ui_bot string" {
  run ui_bot "Hello, World"
  assert_success
  assert_output_regex "^.*Hello, World$"
}

@test "ui_die string" {
  run ui_die "Hello, World"
  assert_failure
  assert_output_regex "^.*Hello, World$"
}

@test "ui_error string" {
  run ui_error "Hello, World"
  assert_success
  assert_output_regex "^.*Hello, World$"
}

@test "ui_info string" {
  run ui_info "Hello, World"
  assert_success
  assert_output_regex "^.*Hello, World$"
}

@test "ui_line" {
  run ui_line
  assert_success
  assert_output_regex "^------------------------------------------------------------------------------------$"
}

@test "ui_ok string" {
  run ui_ok "Hello, World"
  assert_success
  assert_output_regex "^.*[ok].*Hello, World$"
}

@test "ui_running string" {
  run ui_running "Hello, World"
  assert_success
  assert_output_regex "^.*⇒.*Hello, World:$"
}

@test "ui_warn string" {
  run ui_warn "Hello, World"
  assert_success
  assert_output_regex "^.*Hello, World$"
}
