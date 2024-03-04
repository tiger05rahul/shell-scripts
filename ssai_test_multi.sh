#!/bin/bash

# Specify the SSAI links in an array
ssai_links=("cwchannels://aHR0cHM6Ly9zc2FpLmFuaXZpZXcuY29tL2FwaS92MS9obHMvc3RyZWFtLm0zdTg/Y2I9W1RJTUVTVEFNUF9NQUNST10mQVZfV0lEVEg9W1dJRFRIX01BQ1JPXSZBVl9IRUlHSFQ9W0hFSUdIVF9NQUNST10mQVZfU0NIQUlOPVtTQ0hBSU5fTUFDUk9dJkFWX0NDUEE9W0NDUEFfTUFDUk9dJkFWX0dEUFI9W0dEUFJfTUFDUk9dJkFWX0NPTlNFTlQ9W0NPTlNFTlRfTUFDUk9dJkFWX0FQUE5BTUU9W0FQUE5BTUVfTUFDUk9dJkFWX0FQUFNUT1JFVVJMPVtBUFBTVE9SRVVSTF9NQUNST10mQVZfQVBQUEtHTkFNRT1bQlVORExFX0lEX01BQ1JPXSZBVl9JREZBPVtJREZBX01BQ1JPXSZBVl9MQVRJVFVERT1bTEFUSVRVREVfTUFDUk9dJkFWX0xPTkdJVFVERT1bTE9OR0lUVURFX01BQ1JPXSZBVl9VU0VSQUdFTlQ9W1VTRVJBR0VOVF9NQUNST10mQVZTX1NTQUlJRD02NTNmOWI5NTM1YTFkMzZkNjAwOGFmNzQmQVZfVElUTEU9UmVwdWJsaWNCaGFyYXQ=")

# Specify the path to the CSV file
csv_file="ssai_results.csv"

# Function to perform the SSAI request and log the result in the CSV file
perform_ssai_request() {
    link="$1"
    result=$(adb shell am start -a android.intent.action.VIEW -d "$link" tv.cloudwalker.channels | sleep 60 && echo "changing SSAI LINk")

    if [ -z "$result" ]; then
        echo "Pass,$link" >> "$csv_file"
    else
        echo "Failed,$link" >> "$csv_file"
    fi
    }

# Check if the CSV file exists, and if not, create it with a header
if [ ! -e "$csv_file" ]; then
    echo "Result,SSAI Link" > "$csv_file"
fi

# Loop through each SSAI link and perform the request
for link in "${ssai_links[@]}"; do
    perform_ssai_request "$link"
done

