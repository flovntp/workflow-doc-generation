#!/usr/bin/env bash

cp shared/pages/commands.md $1

VERSION=$(platform version)
printf "\n# $VERSION\n" >> $1

printf "\n- [Installation](/administration/cli#1-install)" >> $1
printf "\n- [Open an issue](https://github.com/platformsh/cli/issues)\n" >> $1

printf "\n## All commands\n" >> $1

platform list --format=md | tail -n +2 >> $1

git add sites/platform/src/administration/cli/reference.md
