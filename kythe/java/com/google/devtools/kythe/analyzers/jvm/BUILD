package(
    default_visibility = ["@io_kythe//kythe:default_visibility"],
    licenses = ["notice"],
)

java_library(
    name = "jvm_graph",
    srcs = ["JvmGraph.java"],
    deps = [
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:entryset",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:schema",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:statistics",
        "@io_kythe//kythe/proto:common_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
    ],
)

java_library(
    name = "analyzer",
    srcs = [
        "ClassFileIndexer.java",
        "KytheClassVisitor.java",
    ],
    deps = [
        ":jvm_graph",
        "//kythe/java/com/google/devtools/kythe/extractors/java",
        "//kythe/java/com/google/devtools/kythe/extractors/jvm:jvm_extractor",
        "@com_beust_jcommander//jar",
        "@com_google_protobuf//:any_proto",
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:config",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:entryset",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:schema",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:stream_fact_emitter",
        "@io_kythe//kythe/java/com/google/devtools/kythe/common:flogger",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/kzip",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:analysis_exception",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:file_data",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:statistics",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:json",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:java_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@org_ow2_asm_asm//jar",
    ],
)

java_binary(
    name = "class_file_indexer",
    main_class = "com.google.devtools.kythe.analyzers.jvm.ClassFileIndexer",
    runtime_deps = [":analyzer"],
)
