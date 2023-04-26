#!/bin/bash

echo "Call auto pull $(date) from $(pwd)"
echo $ORCS_WORLD_PATH

remote_commit=$(git -C $ORCS_WORLD_PATH rev-parse origin/main)
local_commit=$(git -C $ORCS_WORLD_PATH rev-parse main)

while true; do
	git fetch

	if [ "$remote_commit" != "$local_commit" ]; then
		echo "Checkout main"
		git -C $ORCS_WORLD_PATH checkout main

		echo "Pull origin"
		git -C $ORCS_WORLD_PATH pull origin main
	fi
	sleep 30
done
