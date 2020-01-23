#!/bin/bash

_error() {
    echo "::error file=entrypoint.sh::${1}"
}

_abort_with_error() {
    _error "${1}"
    exit 1
}

_sanity_checks() {
    local REQUIRED_ENV="SLACK_TOKEN JSON_PATH"
    local RETVAL=0
    for R in ${REQUIRED_ENV}; do
        local _v=INPUT_${R}
        if [[ -z ${!_v} ]]; then
            _error "Environment variable ${R} missing."
            ((RETVAL++))
        fi
    done
    return ${RETVAL}
}

_pre() {
	_sanity_checks
    return $?
}

_send() {
    SLACK_URL='https://hooks.slack.com/services/'${INPUT_SLACK_TOKEN}
    curl -sSL -X POST -H 'Content-type: application/json' --data @"${INPUT_JSON_PATH}" ${URL}
    return $?
}

_run() {
    _pre    || _abort_with_error 'Aborted. Failed in _pre().'
    _send   || _abort_with_error 'Failed sending request to Slack.'
}

_run
