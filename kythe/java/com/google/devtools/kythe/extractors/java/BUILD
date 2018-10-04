package(default_visibility = ["@io_kythe//kythe:default_visibility"])

java_library(
    name = "java",
    srcs = [
        "InputUsageRecord.java",
        "JavaCompilationUnitExtractor.java",
        "ProcessAnnotation.java",
        "UsageAsInputReportingFileManager.java",
        "UsageAsInputReportingJavaFileObject.java",
    ],
    deps = [
        "@com_google_code_findbugs_jsr305//jar",
        "@com_google_protobuf//:any_proto",
        "@com_google_protobuf//:protobuf_java",
        "@com_google_protobuf//:protobuf_java_util",
        "@io_kythe//kythe/java/com/google/devtools/kythe/common:flogger",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared:file_vnames",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/java:options",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/shared:metadata",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:delete_recursively",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:buildinfo_java_proto",
        "@io_kythe//kythe/proto:java_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@io_kythe//third_party/javac",
        "@javax_annotation_jsr250_api//jar",
    ],
)
