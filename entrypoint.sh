#!/bin/bash

echo "Checking REPO URL: $REPO_URL"
echo "Verifying Path: $APP_PATH"
echo "Verifying Script Path: $SCRIPT_PATH"
if [ ! -z "$APP_REPO_URL" ]; then
	if [ ! -d "$APP_PATH/src" ]; then
		echo "SRC Dir Missing, Cloning Repos."
		git clone "$APP_REPO_URL" "$APP_PATH"
		git clone "$SCRIPT_REPO_URL" "$SCRIPT_PATH"
		cd "$APP_PATH/src"
		npm install
	fi
fi	

ln -s "$SCRIPT_PATH" "/usr/local/bin/script"


cd "$APP_PATH"
exec "$@"


