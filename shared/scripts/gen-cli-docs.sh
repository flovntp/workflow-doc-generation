#!/usr/bin/env bash

cp shared/pages/commands.md $1

VERSION=$($2 version)
printf "\n# $VERSION\n" >> $1

printf "\n- [Installation](/administration/cli#1-install)" >> $1
printf "\n- [Open an issue](https://github.com/platformsh/cli/issues)\n" >> $1

printf "\n## All commands\n" >> $1

$2 list --format=md | tail -n +2 >> $1

# amendments
sed -i 's/e\.g\./for example/g' $1
sed -i 's/ csv,/ `csv`,/gI' $1
sed -i 's/ table,/ `table`,/gI' $1
sed -i 's/ tsv,/ `tsv`,/gI' $1
sed -i 's/or plain/or `plain`/gI' $1
sed -i 's/Platform\.sh/{{ vendor\/name }}/g' $1
sed -i 's/Upsun/{{ vendor\/name }}/g' $1

#./shared/scripts/clean-text.sh $1

git add $1
