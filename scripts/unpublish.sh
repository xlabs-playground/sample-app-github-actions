#!/bin/bash
source $(dirname -- ${0})/common.sh

BRANCH_SHA=${1}

for VERSION in $(cat ${PWD}/${BRANCH_SHA}/.artifacts); do
    unpublish ${VERSION}
done

unpublish $(cat ${PWD}/${BRANCH_SHA}/.latest)

echo "Removing ${PWD}/${BRANCH_SHA}..."
echo rm -rf ${PWD}/${BRANCH_SHA}
