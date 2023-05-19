package_name() {
    echo $(node -p -e 'require("./package.json").name')
}

unpublish() {
    local VERSION=${1}
    local PKG_NAME=$(package_name)
    echo "Unpublishing ${PKG_NAME}@${VERSION}..."
    npm unpublish ${PKG_NAME}@${VERSION} --force --registry https://npm.pkg.github.com
}

install() {
    local PKG_NAME=$(package_name)
    local ALIAS=${1}
    local VERSION=${2}
    npm install ${1}@npm:${PKG_NAME}@${VERSION}
}