## [@bashly-upgrade]

## Print a debug message to stderr (only when DEBUG is non-empty).
##
## Example:
## $ DEBUG=1 log_debug "Debug information"
## [2026-03-18 14:30:00] DEBUG: Debug information
log_debug() {
  if [[ -n "${DEBUG:-}" ]]; then
    printf '[%s] DEBUG: %s\n' "$(log_timestamp)" "$*" >&2
  fi
}

## Print an info message to stderr.
##
## Example:
## $ log_info "Starting script"
## [2026-03-18 14:30:00] INFO: Starting script
log_info() {
  printf '[%s] INFO: %s\n' "$(log_timestamp)" "$*" >&2
}

## Print a warning message to stderr.
##
## Example:
## $ log_warn "Warning message"
## [2026-03-18 14:30:00] WARN: Warning message
log_warn() {
  printf '[%s] WARN: %s\n' "$(log_timestamp)" "$*" >&2
}

## Print an error message to stderr.
##
## Example:
## log_error "Error occurred"
## [2026-03-18 14:30:00] ERROR: Error occurred
log_error() {
  printf '[%s] ERROR: %s\n' "$(log_timestamp)" "$*" >&2
}

## Return a formatted timestamp for log messages.
log_timestamp() {
  date +'%Y-%m-%d %H:%M:%S'
}
