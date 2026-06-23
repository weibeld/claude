#!/usr/bin/env bash

input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name')
dir=$(echo "$input" | jq -r '.workspace.current_dir')
session=$(echo "$input" | jq -r '.session_id' | cut -c1-8)
context=$(printf '%.0f' "$(echo "$input" | jq -r '.context_window.used_percentage // 0')")%
echo "${dir} | ${session} | ${model} | ${context}"
