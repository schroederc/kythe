package(default_visibility = ["//visibility:public"])

load("@io_bazel_rules_kotlin//kotlin:kotlin.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "kythe",
    srcs = glob(["**/*.kt"]),
    deps = [
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:entryset",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:schema",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:stream_fact_emitter",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared:file_vnames",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:statistics",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:span",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:common_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@org_jetbrains_kotlin_kotlin_compiler//jar",
    ],
)
