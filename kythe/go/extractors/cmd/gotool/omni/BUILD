load("//tools:build_rules/docker.bzl", "docker_build")

docker_build(
    name = "omni",
    src = "Dockerfile",
    image_name = "gcr.io/kythe-public/golang-extractor-omni",
    tags = ["manual"],
    deps = ["//kythe/go/extractors/cmd/gotool:docker"],
)
