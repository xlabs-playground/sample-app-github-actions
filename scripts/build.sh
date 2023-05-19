#!/bin/env bash
source $(dirname -- ${0})/common.sh

ARTIFACT_NAME=${1}
ENV=${2}
ARTIFACTS=${PWD}/${DEPLOY}

if [[ -d ${ARTIFACTS} ]]; then
    for BRANCH_SHA in $(ls ${ARTIFACTS}); do
        VERSION=$(cat ${ENV}/${BRANCH_SHA}/.latest)
        install ${BRANCH_SHA} ${ARTIFACT_NAME} ${VERSION}
        echo Installed ${BRANCH_SHA} ${ARTIFACT_NAME} ${VERSION}
    done
    mv node_modules build
else
    echo "No artifacts found at ${ARTIFACTS}"
fi