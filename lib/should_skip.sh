#!/bin/bash

set -e

if [[ -z "${INPUT_VALID_WEEK_TYPE}" ]]; then
  echo "Missing INPUT_VALID_WEEK_TYPE" >&2
  exit 1
fi

SHOULD_SKIP=no
if [[ "${INPUT_VALID_WEEK_TYPE}" == "odd" || "${INPUT_VALID_WEEK_TYPE}" == "even" ]]; then
  WEEK=`date +"%V"`
  WEEK=$((10#$WEEK)) # Use base 10 for the week number which may be e.g. "08"
  if [[ $(($WEEK%2)) -eq 0 ]]; then
    CURRENT_WEEK_TYPE="even"
  else
    CURRENT_WEEK_TYPE="odd"
  fi
  if [[ "${CURRENT_WEEK_TYPE}" != "${INPUT_VALID_WEEK_TYPE}" ]]; then
    SHOULD_SKIP=yes
  fi
fi
echo "::set-output name=should_skip::${SHOULD_SKIP}"
