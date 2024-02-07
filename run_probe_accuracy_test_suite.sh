#!/usr/bin/env bash

VIRT_ENV=probe_accuracy_tests-env

SCRIPT=$(realpath "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

source "${HOME}/${VIRT_ENV}/bin/activate"
/usr/bin/env python3 "${SCRIPT_PATH}/probe_accuracy_test_suite.py" "${@}"
deactivate