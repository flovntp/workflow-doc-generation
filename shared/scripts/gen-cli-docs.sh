#!/usr/bin/env bash

cp shared/pages/commands.md ${{ env.PLATFORMSH_CLI_DOC_PATH }}

VERSION=$(platform version)
printf "\n# $VERSION\n" >> sites/platform/src/administration/cli/reference.md

printf "\n- [Installation](/administration/cli#1-install)" >> sites/platform/src/administration/cli/reference.md
printf "\n- [Open an issue](https://github.com/platformsh/cli/issues)\n" >> sites/platform/src/administration/cli/reference.md

printf "\n## All commands\n" >> sites/platform/src/administration/cli/reference.md

platform list --format=md | tail -n +2 >> sites/platform/src/administration/cli/reference.md

git add sites/platform/src/administration/cli/reference.md

git commit -m "Platform.sh CLI command doc page"