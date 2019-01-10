#!/bin/bash -e
#
# Copyright 2019 The Kythe Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Builds and constructs an archive for LLVM used as a Kythe external repo.

BUCKET="gs://kythe-external-deps"

cd "$(dirname "$0")/../.."
kythe/release/appengine/buildbot/cache-llvm.sh --update
source tools/modules/versions.sh

cd third_party/llvm

LLVM_SOURCES=($(bazel query 'kind("source file", deps(set(//third_party/llvm //third_party/llvm:clang_builtin_headers_resources), 2))' \
  | grep '^//third_party/llvm:' \
  | sed 's#^//third_party/llvm:##'))

SYSTEM="$(uname -sm | tr '[:upper:]' '[:lower:]' | tr ' ' '_')"
ARCHIVE="llvm_${MIN_LLVM_SHA}_${MIN_CLANG_SHA}_${SYSTEM}.tar.gz"
trap 'rm -f "$ARCHIVE"; patch -p1 -R <BUILD.patch' EXIT ERR INT
patch -p1 <BUILD.patch
tar cf "$ARCHIVE" BUILD LICENSE "${LLVM_SOURCES[@]}"

echo "Uploading $BUCKET/$ARCHIVE"
gsutil cp "$ARCHIVE" "$BUCKET/"
