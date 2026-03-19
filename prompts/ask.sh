## [@bashly-upgrade]
##
## ask
##
## Usage:
##   ask "Proceed? [Y]es: "
##   ask "Choose color: [Y]ellow, [B]lue: "
##
## Behavior:
##   - Displays the given prompt without a newline.
##   - Reads a single keypress (without waiting for Enter).
##   - Echoes the captured key (so it can be used in scripts).
ask() {
  local message="$1"
  local key

  # Print the message, but don't add a newline
  printf "%s" "$message"

  # Read exactly 1 character silently (-s), with no need for Enter (-n 1)
  # Redirect stdin to /dev/tty in case input is piped
  IFS= read -r -s -n 1 key < /dev/tty

  # Store result in REPLY (like bash `read` builtin)
  REPLY="$key"

  # Print the key back (so the user sees what they typed)
  echo "$key"
}
