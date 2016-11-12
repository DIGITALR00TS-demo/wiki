#!/usr/bin/env bash

rsync -av -e "ssh -v -p22 -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no" site $VDMS_USER@$VDMS_URI:/DEMO-wiki
curl -Sk --verbose \
	-X PUT \
	-H "Authorization: TOK:$VDMS_TOKEN" \
	-H "Content-Type: application/json" \
	-H "Accept: application/json" \
	-d "{ \"MediaPath\":\"http:\/\/wiki.demo.digitalr00ts.com\/\", \"MediaType\":8}" \
	https://api.edgecast.com/v2/mcc/customers/$VDMS_ID/edge/purge
