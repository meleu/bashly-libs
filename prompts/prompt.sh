## [@bashly-upgrade]
##
## prompt
##
## Usage:
##   prompt "Choose a name for your new repo: "
##
## Behavior:
##   - Displays the given prompt.
##   - Waits for the user to type input (any length).
##   - Stores result in $REPLY and echoes it.
prompt() {
  local message="$1"
  local input

  # Display the prompt and wait for input
  printf "%s" "$message"
  IFS= read -r input

  # Store result in REPLY (like bash `read` builtin)
  REPLY="$input"

  # Echo the result for convenience
  echo "$input"
}
