#!/usr/bin/env bats

# Prevent warnings about using `run` with flags
bats_require_minimum_version 1.5.0

# setup
#####################################################################
setup() {
  load 'test_helper/bats-support/load'
  load 'test_helper/bats-assert/load'

  source "${BATS_TEST_DIRNAME}/../logs/logs.sh"
}

# log_debug
#####################################################################
@test "log_debug prints nothing when DEBUG is not set" {
  run --separate-stderr log_debug "Debug information"
  assert_stderr ""
}

@test "log_debug logs when DEBUG is an empty string" {
  DEBUG="" run --separate-stderr log_debug "Debug information"
  assert_stderr ""
}

@test "log_debug logs when DEBUG is any non-empty value" {
  DEBUG=yes run --separate-stderr log_debug "Debug information"
  assert_stderr --regexp '\[.+\] DEBUG: Debug information'

  DEBUG=1 run --separate-stderr log_debug "Debug information"
  assert_stderr --regexp '\[.+\] DEBUG: Debug information'

  DEBUG=anything run --separate-stderr log_debug "Debug information"
  assert_stderr --regexp '\[.+\] DEBUG: Debug information'
}

# log_info
#####################################################################
@test "log_info prints info message" {
  run --separate-stderr log_info "Starting script"
  assert_stderr --regexp '\[.+\] INFO: Starting script'
}

# log_warn
#####################################################################
@test "log_warn prints warning message" {
  run --separate-stderr log_warn "Warning message"
  assert_stderr --regexp '\[.+\] WARN: Warning message'
}

# log_error
#####################################################################
@test "log_error prints error message" {
  run --separate-stderr log_error "Error occurred"
  assert_stderr --regexp '\[.+\] ERROR: Error occurred'
}

# log_timestamp
#####################################################################
@test "log_timestamp returns formatted timestamp" {
  run log_timestamp
  assert_output --regexp '^\[[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\] $'
}

@test "log_timestamp does nothing if NO_LOG_TIMESTAMP is set" {
  NO_LOG_TIMESTAMP=1 run log_timestamp
  assert_output ""
}

@test "NO_LOG_TIMESTAMP skips timestamp in log_* functions' output" {
  NO_LOG_TIMESTAMP=1 run log_info "Starting script"
  assert_output "INFO: Starting script"

  NO_LOG_TIMESTAMP=1 run log_warn "Warning message"
  assert_output "WARN: Warning message"

  NO_LOG_TIMESTAMP=1 run log_error "Error occurred"
  assert_output "ERROR: Error occurred"
}
