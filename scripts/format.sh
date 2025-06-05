#!/bin/bash

# Format script called by the CI
# Usage:
#    format.sh format

#
#  Private Impl
#

format() {
  # Find all C/C++ files
  files=$(find . -name "*.nix")

  if [ -z "$files" ]; then
    echo "No Nix files found"
    return 0
  fi

  # Format each file and capture any errors
  error=0
  for file in $files; do
    if ! nixfmt "$file"; then
      echo "Error formatting $file"
      error=1
    fi
  done

  if [ $error -eq 0 ]; then
    echo "Successfully formatted all files"
    return 0
  else
    echo "Errors occurred during formatting"
    return 1
  fi
}
# Main script logic
case "$1" in
  format)
    format
    ;;
  *)
    echo "Usage: $0 {format}"
    exit 1
    ;;
esac
