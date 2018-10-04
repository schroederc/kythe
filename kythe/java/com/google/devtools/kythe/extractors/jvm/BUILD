package(default_visibility = ["@io_kythe//kythe:default_visibility"])

java_binary(
    name = "jar_extractor",
    srcs = ["JarExtractor.java"],
    main_class = "com.google.devtools.kythe.extractors.jvm.JarExtractor",
    deps = [
        ":jvm_extractor",
        "@com_beust_jcommander//jar",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/indexpack",
        "@io_kythe//third_party/guava",
    ],
)

java_library(
    name = "jvm_extractor",
    srcs = ["JvmExtractor.java"],
    deps = [
        "//kythe/java/com/google/devtools/kythe/analyzers/jvm:jvm_graph",
        "@com_beust_jcommander//jar",
        "@com_google_protobuf//:any_proto",
        "@com_google_protobuf//:protobuf_java",
        "@com_google_protobuf//:protobuf_java_util",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared:file_vnames",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:buildinfo_java_proto",
        "@io_kythe//kythe/proto:java_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
    ],
)
