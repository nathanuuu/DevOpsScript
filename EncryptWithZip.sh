safeopen() {
  unzip "$1" -d .SafeOpenTempDirectory/ > /dev/null
  open .SafeOpenTempDirectory
}
safeclose() {
  echo "Save changes? [y/n]: "
  read saveFlag
  if [ "${saveFlag:0:1}" == "y" ] || [ "${saveFlag:0:1}" == "Y" ]; then
    echo "Save zip file name:"
    read filename
    zip -er $filename.zip .SafeOpenTempDirectory > /dev/null
  fi
  rm -rf .SafeOpenTempDirectory
}
