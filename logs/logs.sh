## [@bashly-upgrade]

## Print a debug message to stderr (only when DEBUG is non-empty).
##
## Example:
## $ DEBUG=1 log_debug "Debug information"
## [2026-03-18 14:30:00] DEBUG: Debug information
log_debug() {
  if [[ -n "${DEBUG:-}" ]]; then
    printf '%sDEBUG: %s\n' "$(log_timestamp)" "$*" >&2
  fi
}

## Print an info message to stderr.
##
## Example:
## $ log_info "Starting script"
## [2026-03-18 14:30:00] INFO: Starting script
log_info() {
  printf '%sINFO: %s\n' "$(log_timestamp)" "$*" >&2
}

## Print a warning message to stderr.
##
## Example:
## $ log_warn "Warning message"
## [2026-03-18 14:30:00] WARN: Warning message
log_warn() {
  printf '%sWARN: %s\n' "$(log_timestamp)" "$*" >&2
}

## Print an error message to stderr.
##
## Example:
## log_error "Error occurred"
## [2026-03-18 14:30:00] ERROR: Error occurred
log_error() {
  printf '%sERROR: %s\n' "$(log_timestamp)" "$*" >&2
}

## Return a formatted timestamp for log messages.
## When NO_LOG_TIMESTAMP is set, do nothing.
log_timestamp() {
  [[ -n "${NO_LOG_TIMESTAMP:-}" ]] && return

  printf '[%s] ' "$(date +'%Y-%m-%d %H:%M:%S')"
}
