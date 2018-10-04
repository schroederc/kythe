package(default_visibility = ["@io_kythe//kythe:default_visibility"])

load("@io_kythe//tools:build_rules/docker.bzl", "docker_build")

# This target builds a docker image which contains java extraction artifacts
# that can be drawn upon in an a la carte fashion for composing customized
# extraction images.
docker_build(
    name = "artifacts",
    src = "Dockerfile",
    data = [
        "//kythe/java/com/google/devtools/kythe/extractors/java/standalone:javac-wrapper.sh",
        "//kythe/java/com/google/devtools/kythe/extractors/java/standalone:javac_extractor_deploy.jar",
        "@io_kythe//kythe/go/extractors/config/runextractor",
        "@io_kythe//third_party/javac:javac_jar",
    ],
    image_name = "gcr.io/kythe_repo/kythe-javac-extractor-artifacts",
    tags = ["manual"],
    use_cache = True,
)
