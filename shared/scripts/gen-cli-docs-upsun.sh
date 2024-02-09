#!/usr/bin/env bash

cp shared/pages/commands.md sites/friday/src/administration/cli/reference.md

VERSION=$(upsun version)
printf "\n# $VERSION\n" >> sites/upsun/src/administration/cli/reference.md

printf "\n- [Installation](/administration/cli#1-install)" >> sites/upsun/src/administration/cli/reference.md
printf "\n- [Open an issue](https://github.com/platformsh/cli/issues)\n" >> sites/upsun/src/administration/cli/reference.md

printf "\n## All commands\n" >> sites/upsun/src/administration/cli/reference.md

upsun list --format=md | tail -n +2 >> sites/upsun/src/administration/cli/reference.md
