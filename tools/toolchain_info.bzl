# look at the toolchains registered in the workspace file with nodejs_register_toolchains

# the name can be anything the user wants this is just added to the target to create unique names
# the order will match against the order in the TOOLCHAIN_VERSION list.
TOOLCHAINS_NAMES = [
    "node14",
    # TODO enable one we know more why there is a memory usage increase and app-shell tests work with Node.js 16.
    # "node16",
]

# this is the list of toolchains that should be used and are registered with nodejs_register_toolchains in the WORKSPACE file
TOOLCHAINS_VERSIONS = [
    select({
        "@bazel_tools//src/conditions:linux_x86_64": "@node14_linux_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:darwin": "@node14_darwin_amd64//:node_toolchain",
        "@bazel_tools//src/conditions:windows": "@node14_windows_amd64//:node_toolchain",
    }),
    # TODO enable one we know more why there is a memory usage increase and app-shell tests work with Node.js 16.
    # select({
    #     "@bazel_tools//src/conditions:linux_x86_64": "@node16_linux_amd64//:node_toolchain",
    #     "@bazel_tools//src/conditions:darwin": "@node16_darwin_amd64//:node_toolchain",
    #     "@bazel_tools//src/conditions:windows": "@node16_windows_amd64//:node_toolchain",
    # }),
]

# A default toolchain for use when only one is necessary
DEFAULT_TOOLCHAIN_VERSION = TOOLCHAINS_VERSIONS[len(TOOLCHAINS_VERSIONS) - 1]
