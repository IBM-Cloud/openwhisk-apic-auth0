source local.env
PACKAGE_NAME=petstore

function usage() {
  echo "Usage: $0 [--install,--uninstall,--update,--recycle,--env]"
}

function install() {

  echo "Creating $PACKAGE_NAME package"
  wsk package create $PACKAGE_NAME

  echo "Creating actions"
  wsk action create $PACKAGE_NAME/getPets actions/getPets.js
  wsk action create $PACKAGE_NAME/postPet actions/postPet.js
}

function uninstall() {
  echo "Removing actions..."
  wsk action delete $PACKAGE_NAME/getPets
  wsk action delete $PACKAGE_NAME/postPet

  echo "Removing package..."
  wsk package delete $PACKAGE_NAME

  echo "Done"
  wsk list
}

function update() {
  echo "Updating actions..."
  wsk action update $PACKAGE_NAME/getPets actions/getPets.js
  wsk action update $PACKAGE_NAME/postPet actions/postPet.js
}

function showenv() {
  echo "PACKAGE_NAME=$PACKAGE_NAME"
}

function recycle() {
  uninstall
  install
}

case "$1" in
"--install" )
install
;;
"--uninstall" )
uninstall
;;
"--update" )
update
;;
"--env" )
showenv
;;
"--recycle" )
recycle
;;
* )
usage
;;
esac
