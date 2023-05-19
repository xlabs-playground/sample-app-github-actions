#!/bin/env bash
ROOT=${1}
PKG_NAME=${2}
CLUSTER=${3}

# Alias is the branch name sha
# Version is the version of the package
# Package name is the name of the package
# Example: install 1234567890 my-package 1.0.0
install() {
    local ALIAS=${1}
    local PKG_NAME=${2}
    local VERSION=${3}
    npm install ${ALIAS}@npm:${PKG_NAME}@${VERSION}
}

if [[ -d ${CLUSTER} ]]; then
    for BRANCH_SHA in $(ls ${CLUSTER}); do
        VERSION=$(cat ${ROOT}/${CLUSTER}/${BRANCH_SHA}/.latest)
        install ${BRANCH_SHA} ${PKG_NAME} ${VERSION}
        echo Installed ${BRANCH_SHA} ${PKG_NAME} ${VERSION}
    done
    mv node_modules build
else
    echo "No artifacts found at ${CLUSTER}"
fi