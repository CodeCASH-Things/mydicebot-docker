#!/bin/bash

echo "Checking REPO URL: $REPO_URL"
echo "Verifying Path: $APP_PATH"
if [ ! -z "$REPO_URL" ]; then
	if [ ! -d "$APP_PATH/src" ]; then
		git clone "$REPO_URL" "$APP_PATH"
		cd "$APP_PATH/src"
		npm install
	fi
fi	

ln -s "$SCRIPT_PATH" "/usr/local/bin/script"


cd "$APP_PATH"
exec "$@"


