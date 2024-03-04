echo "Getting details of ${1}"
/home/rahul/Android/android-sdks/build-tools/28.0.3/aapt  dump badging $1 | grep package:\ name
echo -n -e "\n"
