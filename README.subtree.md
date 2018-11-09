# Add a new `git` subtree

```
# Squash branch history to single commit; embed root file tree at --prefix path; add merge commit
# Notes:
#   - adds a new root commit to repository (squash commit)
#   - does not add any metadata to repository (other than automated commit descriptions)
git subtree add --prefix kythe/kotlin git@github.com:schroederc/kotlin-kythe-plugin.git bazel-build --squash
```

# Pull upstream changes into subtree

```
# Add a new squash commit and merge commit with the latest changes from bazel-build branch
# Notes:
#   - must repeat remote/branch names and --prefix (no stored metadata)
#   - must --squash because initial subtree commit was a squash commit
git subtree pull --prefix kythe/kotlin git@github.com:schroederc/kotlin-kythe-plugin.git bazel-build --squash
```

# Push a local change to a subtree upstream

```
# Push change to kythe/kotlin subtree to bazel-build-downstream-change branch in upstream remote
# Notes:
#   - once again must know/repeat boilerplate args
git subtree push --prefix kythe/kotlin git@github.com:schroederc/kotlin-kythe-plugin.git bazel-build-downstream-change
```
