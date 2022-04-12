#!/bin/bash

SHOULD_SKIP=0
if [[ "${VALID_WEEK_TYPE}" == "odd" || "${VALID_WEEK_TYPE}" == "even" ]]; then
  WEEK=`date +"%V"`
  if [ $(($WEEK%2)) -eq 0 ]; then
    CURRENT_WEEK_TYPE="even"
  else
    CURRENT_WEEK_TYPE="odd"
  fi
  if [[ "${CURRENT_WEEK_TYPE}" != "${VALID_WEEK_TYPE}" ]]; then
    SHOULD_SKIP=1
  fi
fi
echo "::set-output name=should_skip::${SHOULD_SKIP}"
