unpublish() {
    local PKG_NAME=$
    local VERSION=${1}
    echo "Unpublishing ${PKG_NAME}@${VERSION}..."
    npm unpublish ${PKG_NAME}@${VERSION} --force --registry https://npm.pkg.github.com
}
