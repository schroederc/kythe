workspace(name = "io_kythe_java")

# Build against Kythe master.  Run `bazel sync` to update to the latest commit.
http_archive(
    name = "io_kythe",
    strip_prefix = "kythe-external",
    urls = ["https://github.com/schroederc/kythe/archive/external.zip"],
)

load("@io_kythe//:setup.bzl", "kythe_setup")

kythe_setup()

load("@io_kythe//:external.bzl", "kythe_dependencies")

kythe_dependencies()

load("@io_bazel_rules_go//go:def.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

bind(
    name = "libuuid",
    actual = "@io_kythe//third_party:libuuid",
)

bind(
    name = "libmemcached",
    actual = "@org_libmemcached_libmemcached//:libmemcached",
)

bind(
    name = "guava",  # required by @com_google_protobuf
    actual = "@io_kythe//third_party/guava",
)

bind(
    name = "gson",  # required by @com_google_protobuf
    actual = "@com_google_code_gson_gson//jar",
)

bind(
    name = "zlib",  # required by @com_google_protobuf
    actual = "@net_zlib//:zlib",
)
