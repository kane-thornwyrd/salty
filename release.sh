#! /bin/sh

git tag -a $1 -m $1
git push --tags
API_JSON=$(printf '{"tag_name": "v%s","target_commitish": "master","name": "v%s","body": "Release of version %s","draft": false,"prerelease": false}' $1 $1 $1)
curl --data "$API_JSON" https://api.github.com/repos/kane-thornwyrd/salty/releases?access_token=$2