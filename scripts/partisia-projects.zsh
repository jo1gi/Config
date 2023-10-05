function projects() {
    project=$(find $HOME/src/secata -name '.git' | grep -Po '(?<=(/home/jo1gi/src/secata/)).+(?=(/.git))' | sk)
    workspace_num=$(swaymsg -t get_workspaces | jq '. | map(select(.focused)) | .[0].num')
    swaymsg "rename workspace to \"$workspace_num: $project\""
    cd "$HOME/src/secata/$project"
}
