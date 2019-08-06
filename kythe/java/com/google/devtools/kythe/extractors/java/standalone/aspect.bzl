# Copyright 2018 The Kythe Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load("//tools/build_rules/verifier_test:verifier_test.bzl", "extract")

def _extract_java(target, ctx):
    if JavaInfo not in target or not hasattr(ctx.rule.attr, "srcs"):
        return None

    kzip = ctx.actions.declare_file(ctx.label.name + ".java.kzip")

    info = target[JavaInfo]
    compilation = info.compilation_info
    annotations = info.annotation_processing

    classpath = [j.path for j in compilation.compilation_classpath.to_list()]
    bootclasspath = [j.path for j in compilation.boot_classpath]

    processorpath = []
    processors = []
    if annotations and annotations.enabled:
        processorpath += [j.path for j in annotations.processor_classpath.to_list()]
        processors = annotations.processor_classnames

    args = ctx.actions.args()

    # Skip --release options; -source/-target/-bootclasspath are already set
    args.add_all(_remove_flags(compilation.javac_options, {"--release": 1}))
    args.add_joined("-cp", classpath, join_with = ":")
    args.add_joined("-bootclasspath", bootclasspath, join_with = ":")
    args.add_joined("-processorpath", processorpath, join_with = ":")

    if processors:
        args.add_joined("-processor", processors, join_with = ",")
    else:
        args.add("-proc:none")

    deps = []
    for a in target.actions:
        if a.mnemonic == "Javac":
            deps += [a.inputs]

    extract(
        srcs = ctx.rule.files.srcs,
        ctx = ctx,
        extractor = ctx.executable._java_aspect_extractor,
        kzip = kzip,
        mnemonic = "JavaExtractKZip",
        opts = args,
        vnames_config = ctx.file._java_aspect_vnames_config,
        deps = depset(transitive = deps).to_list(),
    )
    return kzip

def _extract_java_aspect(target, ctx):
    kzip = _extract_java(target, ctx)
    if not kzip:
        return struct()
    return [OutputGroupInfo(kzip = [kzip])]

def _remove_flags(lst, to_remove):
    res = []
    skip = 0
    for flag in lst:
        if skip > 0:
            skip -= 1
        elif flag in to_remove:
            skip += to_remove[flag]
        else:
            res += [flag]
    return res

# Aspect to run the javac_extractor on all specified Java targets.
#
# Example usage:
#   bazel build -k --output_groups=kzip \
#       --aspects @io_kythe//tools/build_rules/verifier_test:verifier_test.bzl%extract_java_aspect \
#       //...
extract_java_aspect = aspect(
    _extract_java_aspect,
    attr_aspects = ["srcs"],
    attrs = {
        "_java_aspect_extractor": attr.label(
            default = Label("@io_kythe//kythe/java/com/google/devtools/kythe/extractors/java/standalone:javac_extractor"),
            executable = True,
            cfg = "host",
        ),
        "_java_aspect_vnames_config": attr.label(
            default = Label("//external:vnames_config"),
            allow_single_file = True,
        ),
    },
)

def _extract_java_impl(ctx):
    output = ctx.attr.compilation[OutputGroupInfo]
    return [output, DefaultInfo(files = output.kzip)]

extract_java = rule(
    implementation = _extract_java_impl,
    attrs = {
        "compilation": attr.label(aspects = [extract_java_aspect]),
    },
)
