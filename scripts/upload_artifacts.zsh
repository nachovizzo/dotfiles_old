#!/usr/bin/env zsh
# @file      upload_artifacts.zsh
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
#
# https://docs.gitlab.com/ce/api/projects.html#upload-a-file

source load_colors.zsh
ARTIFACTS="$1"
PROJECT_ID="$2"

echo "${BOLD_YELLOW}Uploading file \"${BOLD_CYAN}${ARTIFACTS}${BOLD_YELLOW}\" to project ID=${BOLD_CYAN}${PROJECT_ID}${RESET}"

# Upload this artifacts, check for the output!!!
curl --header \
    "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    --form "file=@${ARTIFACTS}" \
    "https://gitlab.ipb.uni-bonn.de/api/v4/projects/$PROJECT_ID/uploads" | jq '.'
