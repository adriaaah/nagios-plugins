#!/bin/bash

# Prerequisites:
# 0. Read https://mail.live.com/mail/troubleshooting.aspx
# 1. Sign up to https://support.msn.com/eform.aspx?productKey=edfsjmrpp&page=support_home_options_form_byemail&ct=eformts
# 2. Add your IP/range.
# 3. Enable "Automated Data Access" in https://postmaster.live.com/snds/auto.aspx
# 4. You'll get an URL, composed by a static part plus a private key.
# 5. Put your private key in below variable.

# Variable looks like xxxxxxxx-yyyy-zzzz-aaaaaaaaaaaa
MYKEY=

### Do not touch below this line ###

URL=https://postmaster.live.com/snds/ipStatus.aspx?key=$MYKEY

RESULT=`curl -s $URL | awk -F "," {'print $3'} | tail -n 1`

case "$RESULT" in
"No")   echo "Hotmail is accepting your mails."
        exit 0 # OK
        ;;
"Yes")  echo "You're blocked by Hotmail."
        exit 2 # Critical
        ;;
*)      echo "Unknown error when running the script."
        exit 3 # Unknown
        ;;
esac
