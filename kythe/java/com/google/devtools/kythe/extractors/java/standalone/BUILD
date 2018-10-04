package(default_visibility = ["@io_kythe//kythe:default_visibility"])

exports_files(["javac-wrapper.sh"])

java_binary(
    name = "javac_extractor",
    srcs = [
        "AbstractJavacWrapper.java",
        "Javac8Wrapper.java",
    ],
    data = [
        "@io_kythe//third_party/javac:java_compiler_jar",
        "@io_kythe//third_party/javac:jdk_compiler_jar",
    ],
    jvm_flags = [
        "--add-opens=jdk.compiler/com.sun.tools.javac.api=java.compiler",
        "--patch-module=java.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:java_compiler_jar)",
        "--patch-module=jdk.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:jdk_compiler_jar)",
    ],
    main_class = "com.google.devtools.kythe.extractors.java.standalone.Javac8Wrapper",
    visibility = ["//visibility:public"],
    deps = [
        "//kythe/java/com/google/devtools/kythe/extractors/java",
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared:file_vnames",
        "@io_kythe//kythe/java/com/google/devtools/kythe/platform/indexpack",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:json",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@io_kythe//third_party/javac",
    ],
)
