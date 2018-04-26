#
# Time
#
# Current time

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_TIME_SHOW="${SPACESHIP_TIME_SHOW=false}"
SPACESHIP_TIME_AMPM_SHOW="${SPACESHIP_TIME_AMPM_SHOW=false}"
SPACESHIP_TIME_PREFIX="${SPACESHIP_TIME_PREFIX="at "}"
SPACESHIP_TIME_SUFFIX="${SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_TIME_FORMAT="${SPACESHIP_TIME_FORMAT=false}"
SPACESHIP_TIME_12HR="${SPACESHIP_TIME_12HR=false}"
SPACESHIP_TIME_COLOR="${SPACESHIP_TIME_COLOR="yellow"}"
SPACESHIP_TIME_PM="${SPACESHIP_TIME_PM="🌙 "}"
SPACESHIP_TIME_AM="${SPACESHIP_TIME_AM="⛅ "}"


# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_time() {
  [[ $SPACESHIP_TIME_SHOW == false ]] && return

  local day_symbol

  if [ `date +%H` -lt 12 ]; then
    day_symbol="${SPACESHIP_TIME_AM}"
  else
    day_symbol="${SPACESHIP_TIME_PM}"
  fi

  [[ $SPACESHIP_TIME_SHOW_AMPM == false ]] && day_symbol=""

  local time_str

  if [[ $SPACESHIP_TIME_FORMAT != false ]]; then
    time_str="$day_symbol${SPACESHIP_TIME_FORMAT}"
  elif [[ $SPACESHIP_TIME_12HR == true ]]; then
    time_str="$day_symbol%D{%r}"
  else
    time_str="$day_symbol%D{%T}"
  fi

  spaceship::section \
    "$SPACESHIP_TIME_COLOR" \
    "$SPACESHIP_TIME_PREFIX" \
    "$time_str" \
    "$SPACESHIP_TIME_SUFFIX"
}
