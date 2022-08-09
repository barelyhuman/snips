#!/usr/bin/env bash 

set -euxo pipefail

curl -o alvu.tgz -L https://codeberg.org/attachments/ae8cf46a-3450-4614-951f-6a30160de1ec
tar -xvzf alvu.tgz
install linux-amd64/alvu /usr/local/bin

alvu 