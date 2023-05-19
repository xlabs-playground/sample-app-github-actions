package_name() {
    echo $(node -p -e 'require("./package.json").name')
}

unpublish() {
    local PKG_NAME=$
    local VERSION=${1}
    echo "Unpublishing ${PKG_NAME}@${VERSION}..."
    npm unpublish ${PKG_NAME}@${VERSION} --force --registry https://npm.pkg.github.com
}

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