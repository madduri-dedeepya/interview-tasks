#!/bin/bash

#URL: the website with API call information
URL="https://azure.microsoft.com/en-us/get-started/azure-portal"
#URL=" You can access any website here URL"

# Use curl to fetch the webpage content
WEB_CONTENT=$(curl -s "$URL")

# Check if the request was successful
if [ $? -eq 0 ]; then
    # Extract API calls using grep and awk
    API_CALLS=$(echo "$WEB_CONTENT" | grep -o '"api_call": *"[^"]*' | awk -F'"' '{print $4}')

    if [ -n "$API_CALLS" ]; then
        echo "Available API calls:"
        echo "$API_CALLS"
    else
        echo "No API calls found on the website."
    fi
else
    echo "Failed to retrieve information from $URL"
fi
