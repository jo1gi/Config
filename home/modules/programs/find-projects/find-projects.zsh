function projects() {
    project=$(find "${FIND_PROJECTS_DIR}" -maxdepth 4 -mindepth 2 -name '.git' | grep -Po "(?<=(${FIND_PROJECTS_DIR}/)).+(?=(/.git))" | sk)
    if command -v rename-workspace &> /dev/null; then
        rename-workspace "$project"
    fi
    cd "${FIND_PROJECTS_DIR}/$project"
}
