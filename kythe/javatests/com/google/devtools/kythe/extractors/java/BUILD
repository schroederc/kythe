java_test(
    name = "java_extractor_test",
    size = "small",
    srcs = ["JavaExtractorTest.java"],
    data = glob(["testdata/**"]) + [
        ":SillyProcessor_deploy.jar",
        "@io_kythe//third_party/javac:java_compiler_jar",
        "@io_kythe//third_party/javac:jdk_compiler_jar",
    ],
    javacopts = ["-Xlint:all"],
    jvm_flags = [
        "--add-opens=jdk.compiler/com.sun.tools.javac.api=java.compiler",
        "--patch-module=java.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:java_compiler_jar)",
        "--patch-module=jdk.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:jdk_compiler_jar)",
    ],
    test_class = "com.google.devtools.kythe.extractors.java.JavaExtractorTest",
    deps = [
        "//kythe/java/com/google/devtools/kythe/extractors/java",
        "@com_google_protobuf//:any_proto",
        "@com_google_protobuf//:protobuf_java",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/proto:analysis_java_proto",
        "@io_kythe//kythe/proto:java_java_proto",
        "@io_kythe//kythe/proto:storage_java_proto",
        "@io_kythe//third_party/guava",
        "@io_kythe//third_party/javac",
        "@io_kythe//third_party/truth",
        "@junit_junit//jar",
    ],
)

java_binary(
    name = "SillyProcessor",
    srcs = [
        "testdata/processor/Silly.java",
        "testdata/processor/SillyProcessor.java",
    ],
    create_executable = 0,
    deps = ["@bazel_tools//tools/jdk:langtools-neverlink"],
)
