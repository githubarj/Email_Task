#!/bin/bash

sendemail() {

    read -p "Email address of the recipient?" recipient

    if [[ ! "$recipient" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
        echo "Error: Invalid email address format. Please enter a valid email address."
        return 1
    fi

    read -p "What is the subject of your email?"  subject

    read -p "What is the body of your email?"  body

    read -p "Enter the file path of the attachment (leave blank if none):" attachment

    if [ -n "$attachment" ] && [ -f "$attachment" ]; then
        attachment_content=$(base64 "$attachment")           # Encode attachment in base64
        attachment_filename=$(basename "$attachment")        # Extract filename from path
        attachment_mime=$(file -b --mime-type "$attachment") # Get mime type of attachment MIME stands for "Multipurpose Internet Mail Extensions." MIME types are a standard way to indicate the type of data contained in a file or served by a web server.

        echo -e "Subject: $subject\nMIME-Version: 1.0\nContent-Type: multipart/mixed; boundary=\"BOUNDARY\"\n--BOUNDARY\nContent-Type: text/plain\n$body\n--BOUNDARY\nContent-Type: $attachment_mime; name=\"$attachment_filename\"\nContent-Disposition: attachment; filename=\"$attachment_filename\"\nContent-Transfer-Encoding: base64\n\n$attachment_content\n--BOUNDARY--" | ssmtp "$recipient"
    else
        echo -e "Subject: $subject\n$body" | ssmtp "$recipient"
    fi
}

sendemail

if [ $? -eq 0 ]; then

    echo "Email sent successfully to $recipient."
else

    echo "Failure"

fi
