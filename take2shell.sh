if [[ $1 == "tv" ]]; then
  kermit -c -l /dev/ttyUSB1 -b 115200
elif [[ $1 == "box" ]]; then
  kermit -c -l /dev/tty.usbserial-0001 -b 115200
elif [[ $1 == "libre" ]]; then
  kermit -c -l /dev/tty.usbserial-1420 -b 57600
else
  kermit -c -l /dev/tty.SLAB_USBtoUART -b 115200
fi
