load("@container_structure_test//:defs.bzl", "container_structure_test")
load("@rules_oci//oci:defs.bzl", "oci_image", "oci_image_index")
load("@rules_pkg//:pkg.bzl", "pkg_tar")
load("//:checksums.bzl", ARCHITECTURES = "BASE_ARCHITECTURES")
load("//private/util:deb.bzl", "deb")
load("@rules_oci//oci:defs.bzl", "oci_tarball")

package(default_visibility = ["//visibility:public"])

USERS = [
    "root",
    "nonroot",
]

DISTROS = [
    "debian12",
]

DISTRO_VERSION = {
    "debian12": "15",
}

[
    oci_image_index(
        name = ("postgres" if (not mode) else mode[1:]) + "_" + user + "_" + distro,
        images = [
            ("postgres" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro
            for arch in ARCHITECTURES
        ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for user in USERS
    for distro in DISTROS
]

[
    oci_image(
        name = ("postgres" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        # Based on //cc so that C extensions work properly.
        base = "//cc" + (mode if mode else ":cc") + "_" + user + "_" + arch + "_" + distro,
        # entrypoint = [
        #     "/usr/lib/postgresql/15/bin/postgres",
        # ],
        # Use UTF-8 encoding for file system: match modern Linux
        env = {"LANG": "C.UTF-8"},
        tars = [
          deb.package(arch, distro, "dash"),
          deb.package(arch, distro, "libacl1"),
          deb.package(arch, distro, "libapt-pkg6.0"),
          deb.package(arch, distro, "libassuan0"),
          deb.package(arch, distro, "libattr1"),
          deb.package(arch, distro, "libaudit-common"),
          deb.package(arch, distro, "libaudit1"),
          deb.package(arch, distro, "libblkid1"),
          deb.package(arch, distro, "libbsd0"),
          deb.package(arch, distro, "libbz2-1.0"),
          deb.package(arch, distro, "libc-bin"),
          deb.package(arch, distro, "libc-l10n"),
          deb.package(arch, distro, "libc6"),
          deb.package(arch, distro, "libcap-ng0"),
          deb.package(arch, distro, "libcap2"),
          deb.package(arch, distro, "libcom-err2"),
          deb.package(arch, distro, "libcrypt1"), # TODO: glibc library for -lcrypt; maybe should be in cc?
          deb.package(arch, distro, "libdb5.3"),
          deb.package(arch, distro, "libdebconfclient0"),
          deb.package(arch, distro, "libedit2"),
          # deb.package(arch, distro, "libexpat1"),
          deb.package(arch, distro, "libext2fs2"),
          deb.package(arch, distro, "libffi8"),
          deb.package(arch, distro, "libgcc-s1"),
          deb.package(arch, distro, "libgcrypt20"),
          deb.package(arch, distro, "libgdbm-compat4"),
          deb.package(arch, distro, "libgdbm6"),
          deb.package(arch, distro, "libgmp10"),
          deb.package(arch, distro, "libgnutls30"),
          deb.package(arch, distro, "libgpg-error0"),
          deb.package(arch, distro, "libgssapi-krb5-2"),
          deb.package(arch, distro, "libhogweed6"),
          deb.package(arch, distro, "libicu72"),
          deb.package(arch, distro, "libidn2-0"),
          deb.package(arch, distro, "libjson-perl"),
          deb.package(arch, distro, "libk5crypto3"),
          deb.package(arch, distro, "libkeyutils1"),
          deb.package(arch, distro, "libkrb5-3"),
          deb.package(arch, distro, "libkrb5support0"),
          deb.package(arch, distro, "libksba8"),
          deb.package(arch, distro, "libldap-2.5-0"),
          deb.package(arch, distro, "libllvm16"),
          deb.package(arch, distro, "liblz4-1"),
          deb.package(arch, distro, "liblzma5"),
          deb.package(arch, distro, "libmd0"),
          deb.package(arch, distro, "libmount1"),
          deb.package(arch, distro, "libncursesw6"),
          deb.package(arch, distro, "libnettle8"),
          deb.package(arch, distro, "libnpth0"),
          deb.package(arch, distro, "libnss-wrapper"),
          deb.package(arch, distro, "libpam-modules"),
          deb.package(arch, distro, "libpam-modules-bin"),
          deb.package(arch, distro, "libpam-runtime"),
          deb.package(arch, distro, "libpam0g"),
          deb.package(arch, distro, "libpcre2-8-0"),
          deb.package(arch, distro, "libperl5.36"),
          deb.package(arch, distro, "libpq5"),
          deb.package(arch, distro, "libreadline8"),
          deb.package(arch, distro, "libsasl2-2"),
          deb.package(arch, distro, "libsasl2-modules-db"),
          deb.package(arch, distro, "libseccomp2"),
          deb.package(arch, distro, "libselinux1"),
          deb.package(arch, distro, "libsemanage-common"),
          deb.package(arch, distro, "libsemanage2"),
          deb.package(arch, distro, "libsepol2"),
          deb.package(arch, distro, "libsmartcols1"),
          deb.package(arch, distro, "libsqlite3-0"),
          deb.package(arch, distro, "libss2"),
          deb.package(arch, distro, "libssl3"),
          deb.package(arch, distro, "libstdc++6"),
          deb.package(arch, distro, "libsystemd0"),
          deb.package(arch, distro, "libtasn1-6"),
          deb.package(arch, distro, "libtinfo6"),
          deb.package(arch, distro, "libtirpc3"),
          deb.package(arch, distro, "libudev1"),
          deb.package(arch, distro, "libunistring2"),
          deb.package(arch, distro, "libuuid1"),
          deb.package(arch, distro, "libxml2"),
          deb.package(arch, distro, "libxslt1.1"),
          deb.package(arch, distro, "libxxhash0"),
          deb.package(arch, distro, "libz3-4"),
          deb.package(arch, distro, "libzstd1"),
          deb.package(arch, distro, "postgresql-15"),
          deb.package(arch, distro, "libp11-kit0"),
       ],
    )
    for mode in [
        "",
        ":debug",
    ]
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
]


[
    oci_tarball(
        name = ("postgres" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro + "_tarball",
        image = ("postgres" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        repo_tags = [],
    )
    for mode in [":", ":debug"]
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
    if ("postgres" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro != "postgres:_nonroot_amd64_debian12"
]




# [
#     container_structure_test(
#         name = "python3_" + user + "_" + arch + "_" + distro + "_test",
#         size = "medium",
#         configs = ["testdata/python3.yaml"],
#         image = ":python3_" + user + "_" + arch + "_" + distro,
#         tags = [
#             "manual",
#             arch,
#         ],
#     )
#     for user in USERS
#     for arch in ARCHITECTURES
#     for distro in DISTROS
# ]

# # tests for version-specific things
# [
#     container_structure_test(
#         name = "version_specific_" + user + "_" + arch + "_" + distro + "_test",
#         size = "medium",
#         configs = ["testdata/" + distro + ".yaml"],
#         image = ":python3_" + user + "_" + arch + "_" + distro,
#         tags = [
#             "manual",
#             arch,
#         ],
#     )
#     for user in USERS
#     for arch in ARCHITECTURES
#     for distro in DISTROS
# ]

