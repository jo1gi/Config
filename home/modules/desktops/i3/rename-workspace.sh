#!/usr/bin/env bash
workspace_num=$(i3-msg -t get_workspaces | jq '. | map(select(.focused)) | .[0].num')
i3-msg "rename workspace to \"$workspace_num: $1\""
