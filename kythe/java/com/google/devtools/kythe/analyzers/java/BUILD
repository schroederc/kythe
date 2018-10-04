package(default_visibility = ["@io_kythe//kythe:default_visibility"])

java_library(
    name = "analyzer",
    srcs = [
        "JavaEntrySets.java",
        "JavaIndexerConfig.java",
        "JavaNode.java",
        "KytheDocTreeScanner.java",
        "KytheJavacAnalyzer.java",
        "KytheTreeScanner.java",
        "MarkedSources.java",
        "MiniAnchor.java",
        "NameVisitor.java",
        "SourceText.java",
        "TreeContext.java",
    ],
    deps = [
        ":plugin",
        "//kythe/java/com/google/devtools/kythe/analyzers/jvm:jvm_graph",
        "@com_beust_jcommander//jar",
        "@com_google_code_findbugs_jsr305//jar",
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:config",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:entryset",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:schema",
        "@io_kythe//kythe/java/com/google/devtools/kythe/common:flogger",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java/filemanager",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java/helpers",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:analysis_exception",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:metadata",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:statistics",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:kythe_uri",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:position_mappings",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:span",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:common_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@io_kythe//third_party/javac",
    ],
)

java_library(
    name = "source_text",
    srcs = ["SourceText.java"],
    deps = [
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java/helpers",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:position_mappings",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:span",
        "@io_kythe//third_party/javac",
    ],
)

java_library(
    name = "plugin",
    srcs = ["Plugin.java"],
    deps = [
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:entryset",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java/helpers",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:span",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/javac",
    ],
)

java_binary(
    name = "indexer",
    srcs = ["JavaIndexer.java"],
    data = ["@io_kythe//third_party/javac:java_compiler_jar"],
    jvm_flags = [
        "--add-opens=jdk.compiler/com.sun.tools.javac.api=java.compiler",
        "--patch-module=java.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:java_compiler_jar)",
    ],
    main_class = "com.google.devtools.kythe.analyzers.java.JavaIndexer",
    deps = [
        ":analyzer",
        ":plugin",
        "//kythe/java/com/google/devtools/kythe/extractors/java",
        "@com_beust_jcommander//jar",
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/analyzers/base:stream_fact_emitter",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/indexpack",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/kzip",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:analysis_exception",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:file_data",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:metadata",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:statistics",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:json",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
    ],
)
