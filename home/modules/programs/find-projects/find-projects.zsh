function projects() {
    relative_dir=$(find "${FIND_PROJECTS_DIR}" -maxdepth 5 -mindepth 2 -name '.git' | grep -Po "(?<=(${FIND_PROJECTS_DIR}/)).+(?=(/.git))" | sk)
    if [[ -z "$relative_dir" ]]; then
        return
    fi
    parts=(${(s[/])relative_dir})
    if command -v rename-workspace &> /dev/null; then
        rename-workspace "$parts[-2]/$parts[-1]"
    fi
    cd "${FIND_PROJECTS_DIR}/$relative_dir"
}
