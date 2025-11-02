#!/bin/bash

#==============================================================================
# Color Setup (tput fallback)
#==============================================================================
if command -v tput >/dev/null && [ -n "$(tput colors)" ]; then
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  RED='\033[31m'
  GREEN='\033[32m'
  YELLOW='\033[33m'
  BLUE='\033[34m'
  BOLD='\033[1m'
  RESET='\033[0m'
fi
export BLUE GREEN YELLOW RED RESET BOLD

UNITNAME="${LOG_UNITNAME:-logmsg.sh}"

#==============================================================================
# Logging Functions
#==============================================================================

log() {
  local level="$1"
  local color="$2"
  local message="$3"
  local timestamp
  timestamp=$(date +"%Y-%m-%d %H:%M:%S")
  echo -e "${color}${timestamp} [${level}] ${message}${RESET}"
  echo "[${level}] ${message}" | systemd-cat -t "${UNITNAME}" -p info
}

info()    { log "INFO"    "${BLUE}"   "$1"; }
warn()    { log "WARN"    "${YELLOW}" "$1"; }
error()   { log "ERROR"   "${RED}"    "$1"; }
success() { log "SUCCESS" "${GREEN}"  "$1"; }

custom() {
  local level="$1"
  local color="$2"
  local message="$3"
  log "$level" "$color" "$message"
}

#==============================================================================
# Error Handling & Argument Parsing
#==============================================================================

print_usage() {
  echo -e "${BOLD}Usage:${RESET}"
  echo "  $0 info \"message\""
  echo "  $0 warn \"message\""
  echo "  $0 error \"message\""
  echo "  $0 success \"message\""
  echo "  $0 custom \"LEVEL\" \"COLOR\" \"message\""
  echo ""
  echo "    COLOR can be:"
  echo "      - An ANSI escape code (e.g., \"\\033[36m\")"
  echo "      - A predefined variable: \$RED \$GREEN \$YELLOW \$BLUE"
  echo "      - A dynamic color from tput: \$(tput setaf N), where N is 0-255 depending on your terminal"
  echo ""
  echo "    Example (256-color tput):"
  echo "      $0 custom \"NOTICE\" \"\$(tput setaf 214)\" \"orange-like message\""
  exit 1
}

if [ "$#" -lt 2 ]; then
  echo -e "${RED}Error: insufficient arguments.${RESET}"
  print_usage
fi

mode="$1"
shift

case "$mode" in
  info|warn|error|success)
    if [ "$#" -ne 1 ]; then
      echo -e "${RED}$mode expects exactly 1 message argument.${RESET}"
      print_usage
    fi
    "$mode" "$1"
    ;;
  custom)
    if [ "$#" -ne 3 ]; then
      echo -e "${RED}custom expects [LEVEL] [COLOR] [MESSAGE].${RESET}"
      print_usage
    fi
    level="$1"
    color="$2"
    msg="$3"
    # Support named colors from env
    [[ "$color" =~ ^\$ ]] && color="${!color:1}"
    custom "$level" "$color" "$msg"
    ;;
  *)
    echo -e "${RED}Unknown mode: $mode${RESET}"
    print_usage
    ;;
esac
