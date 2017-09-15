safeopen() {
  if [ -d ".SafeOpenTempDirectory" ]; then
    echo "Existing file in 'safeopen' mode. Please 'safeclose' that file first."
    return
  fi
  if [ "$#" -ne 1 ]; then
    echo "Enter file name: "
    read filename
  else
    filename="$1"
  fi
  unzip "$filename" -d .SafeOpenTempDirectory/
  if [ $? -eq 0 ]; then
    touch .SafeOpenTempDirectory/.originalFileName
    echo "$filename" >> .SafeOpenTempDirectory/.originalFileName
    open .SafeOpenTempDirectory
  else
    rm -rf .SafeOpenTempDirectory
  fi
}
safeclose() {
  if [ ! -d ".SafeOpenTempDirectory" ]; then
    echo "No existing file in 'safeopen' mode. "
    return
  fi
  echo "Save changes? [y/n]: "
  read saveFlag
  if [ "${saveFlag:0:1}" == "y" ] || [ "${saveFlag:0:1}" == "Y" ]; then
    filename=$(head -1 .SafeOpenTempDirectory/.originalFileName)
    rm -f .SafeOpenTempDirectory/.originalFileName > /dev/null
    zip -ej $filename .SafeOpenTempDirectory/*
  fi
  rm -rf .SafeOpenTempDirectory
}
