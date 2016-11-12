#!/usr/bin/env bash

rsync -av -e "sshpass -e ssh -v -p22 -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no" -rR site/ $VDMS_USER@$VDMS_URI:/DEMO-wiki

curl -Skv \
	-X PUT \
	-H "Authorization: TOK:$VDMS_TOKEN" \
	-H "Content-Type: application/json" \
	-H "Accept: application/json" \
	-d "{ \"MediaPath\":\"http:\/\/wiki.demo.digitalr00ts.com\/\", \"MediaType\":8}" \
	https://api.edgecast.com/v2/mcc/customers/$VDMS_ID/edge/purge
