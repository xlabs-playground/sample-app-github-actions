#!/bin/env bash
source $(dirname -- ${0})/common.sh

DEPLOY=${1}
ARTIFACTS=${PWD}/${DEPLOY}

if [[ -f ${ARTIFACTS} ]]; then
    for BRANCH_SHA in $(ls ${ARTIFACTS}); do
        VERSION=$(cat ${ARTIFACTS}/${BRANCH_SHA}/.latest)
        install ${BRANCH_SHA} ${VERSION}
    done
    mv node_modules build
else
    echo "No artifacts found at ${ARTIFACTS}"
fi