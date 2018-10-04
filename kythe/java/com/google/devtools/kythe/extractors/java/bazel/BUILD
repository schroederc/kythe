package(default_visibility = ["@io_kythe//kythe:default_visibility"])

action_listener(
    name = "extract_kindex",
    extra_actions = [":extra_action"],
    mnemonics = ["Javac"],
    visibility = ["//visibility:public"],
)

extra_action(
    name = "extra_action",
    cmd = "$(location :java_extractor) $(EXTRA_ACTION_FILE) $(output $(ACTION_ID).java.kindex) $(location @io_kythe//kythe/data:vnames_config)",
    data = ["@io_kythe//kythe/data:vnames_config"],
    out_templates = ["$(ACTION_ID).java.kindex"],
    tools = [":java_extractor"],
)

java_binary(
    name = "java_extractor",
    srcs = ["JavaExtractor.java"],
    data = [
        "@io_kythe//third_party/javac:java_compiler_jar",
        "@io_kythe//third_party/javac:jdk_compiler_jar",
    ],
    jvm_flags = [
        "--add-opens=jdk.compiler/com.sun.tools.javac.api=java.compiler",
        "--patch-module=java.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:java_compiler_jar)",
        "--patch-module=jdk.compiler=$${RUNPATH}$(location @io_kythe//third_party/javac:jdk_compiler_jar)",
    ],
    main_class = "com.google.devtools.kythe.extractors.java.bazel.JavaExtractor",
    deps = [
        "//kythe/java/com/google/devtools/kythe/extractors/java",
        "@com_google_protobuf//:protobuf_java",
        "@com_google_protobuf//:protobuf_java_util",
        "@io_kythe//kythe/java/com/google/devtools/kythe/common:flogger",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared",
        "@io_kythe//kythe/java/com/google/devtools/kythe/extractors/shared:file_vnames",
        "@io_kythe//kythe/java/com/google/devtools/kythe/util:json",
        "@io_kythe//kythe/proto:buildinfo_java_proto",
        "@io_kythe//kythe/proto:java_java_proto",
        "@io_kythe//third_party/bazel:extra_actions_base_java_proto",
        "@io_kythe//third_party/guava",
        "@io_kythe//third_party/javac",
    ],
)
