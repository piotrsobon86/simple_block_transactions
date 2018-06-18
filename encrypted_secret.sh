#!/bin/bash

echo -e "Enter password: \c "
read  password
password_sha256=$(echo -n $password | openssl dgst -sha256 | awk '{print $2}')
openssl aes-256-cbc -in secret.key -out encrypted_secret.key -K $password_sha256 -iv 36343037356365613639306433326162
echo "Generated: encrypted_secret.key"