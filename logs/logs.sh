## [@bashly-upgrade]

## Print a debug message to stderr (only when DEBUG is non-empty).
##
## Example:
## $ DEBUG=1 log_debug "Debug information"
## [2026-03-18 14:30:00] DEBUG: Debug information
log_debug() {
  [[ -z "${DEBUG:-}" ]] && return
  _log DEBUG "$@"
}

## Print an info message to stderr.
##
## Example:
## $ log_info "Starting script"
## [2026-03-18 14:30:00] INFO: Starting script
log_info() {
  _log INFO "$@"
}

## Print a warning message to stderr.
##
## Example:
## $ log_warn "Warning message"
## [2026-03-18 14:30:00] WARN: Warning message
log_warn() {
  _log WARN "$@"
}

## Print an error message to stderr.
##
## Example:
## log_error "Error occurred"
## [2026-03-18 14:30:00] ERROR: Error occurred
log_error() {
  _log ERROR "$@"
}

## Return a formatted timestamp for log messages.
## When NO_LOG_TIMESTAMP is set, do nothing.
_log_timestamp() {
  [[ -n "${NO_LOG_TIMESTAMP:-}" ]] && return
  printf '[%s] ' "$(date +'%Y-%m-%d %H:%M:%S')"
}

## Print a log line to stderr.
_log() {
  local level="$1"
  shift
  printf '%s%s: %s\n' "$(_log_timestamp)" "${level}" "$*" >&2
}
