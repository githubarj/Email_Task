#!/bin/bash

sendemail() {
    # subject="Test Email"
    # body="This is a test email"
    recipient="githuba9520@gmail.com"

    echo "What is the subject of your Email?"
    read subject
    echo "What is the body of your Email?"
    read body

    echo -e "Subject: $subject\n$body" | ssmtp $recipient
}
sendemail

if [ $? -eq 0 ]; then

    echo "Success"
else

    echo "Failure"

fi
