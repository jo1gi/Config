#!/usr/bin/env bash
WORKDIR="$PWD"

if [[ ! -f ".gitlab-ci.yml" ]]; then
    echo "No .gitlab-ci file found in $WORKDIR"
    exit 1
fi

git commit --allow-empty -m "Re-run pipeline" .gitlab-ci.yml
git push
