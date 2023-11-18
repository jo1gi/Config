#!/usr/bin/env bash
workspace_num=$(swaymsg -t get_workspaces | jq '. | map(select(.focused)) | .[0].num')
swaymsg "rename workspace to \"$workspace_num: $1\""
