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
sed -i 's/ csv,/ `csv`,/g' $1
sed -i 's/ table,/ `table`,/g' $1
sed -i 's/ tsv,/ `tsv`,/g' $1
sed -i 's/commit_id/`commit_id`/g' $1
sed -i 's/expires_at/`expires_at`/g' $1
sed -i 's/updated_at/`updated_at`/g' $1
sed -i 's/Platform.sh/{{ vendor/name }}/g' $1
sed -i 's/Upsun/{{ vendor/name }}/g' $1

#./shared/scripts/clean-text.sh $1

git add $1
