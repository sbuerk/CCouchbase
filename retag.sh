#!/bin/bash

########################################################################################################################
# 1. DETECT SCRIPT DIR
########################################################################################################################
SCRIPT_FILE="${BASH_SOURCE[0]}"
while [ -h "${SCRIPT_FILE}" ]; do # resolve ${SCRIPT_FILE} until the file is no longer a symlink
  TMPDIR="$( cd -P "$( dirname "${SCRIPT_FILE}" )" && pwd )"
  SCRIPT_FILE="$(readlink "${SCRIPT_FILE}")"
  [[ ${SCRIPT_FILE} != /* ]] && SOURCE="${TMPDIR}/${SCRIPT_FILE}"
done
SCRIPT_PATH_REAL="$( cd -P "$( dirname "${SCRIPT_FILE}" )" && pwd )"
SCRIPT_FILE_REAL="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
SCRIPT_FILE_SYML="$(basename "$0")"
########################################################################################################################
SCRIPT_PATH=${SCRIPT_PATH_REAL}
SCRIPT_FILE=${SCRIPT_FILE_REAL}
PATH_CUR="$( pwd )"
cd "${SCRIPT_PATH}"
########################################################################################################################

echo "Be careful with that, you know: man git-tag."

RETAG_VERSION="1.0.0"
git tag -f "${RETAG_VERSION}"