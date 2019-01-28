#!/bin/bash -e

cd "$(dirname "$0")"

jsonnet go_extractions.json | jq -r '.[] | ["_IMPORTPATH="+.importpath, "_REPO="+.repository, "_COMMIT="+.commit, "_REPO_ROOT="+.root] | join(",")' |
  parallel -P0 -L1 -tu gcloud builds submit \
  --config go_extract.yaml \
  --no-source \
  "--substitutions=_BUCKET_NAME=kythe-oss-builds,{}"
