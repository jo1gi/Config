function projects() {
    project=$(find "${FIND_PROJECTS_DIR}" -maxdepth 4 -mindepth 2 -name '.git' | grep -Po "(?<=(${FIND_PROJECTS_DIR}/)).+(?=(/.git))" | sk)
    workspace_num=$(swaymsg -t get_workspaces | jq '. | map(select(.focused)) | .[0].num')
    swaymsg "rename workspace to \"$workspace_num: $project\""
    cd "${FIND_PROJECTS_DIR}/$project"
}
