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
        name = ("php" if (not mode) else mode[1:]) + "_" + user + "_" + distro,
        images = [
            ("php" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro
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
        name = ("php" if (not mode) else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        base = "//cc" + (mode if mode else ":cc") + "_" + user + "_" + arch + "_" + distro,
        entrypoint = [
            "/usr/bin/php"
        ],
        env = {"LANG": "C.UTF-8"},
        tars = [
            deb.package(arch, distro, "dash"),
            deb.package(arch, distro, "libacl1"),
            deb.package(arch, distro, "libc6"),
            deb.package(arch, distro, "libcurl4"),
            deb.package(arch, distro, "libedit2"),
            deb.package(arch, distro, "libsqlite3-0"),
            deb.package(arch, distro, "zlib1g"),
            deb.package(arch, distro, "libpng16-16"),
            deb.package(arch, distro, "libxml2"),
            deb.package(arch, distro, "libonig5"),   
            deb.package(arch, distro, "libfreetype6"),
            deb.package(arch, distro, "libjpeg62-turbo"),
            deb.package(arch, distro, "libxslt1.1"),
            deb.package(arch, distro, "libzip4"),
            deb.package(arch, distro, "php-cli"),
            deb.package(arch, distro, "php-fpm"),
            deb.package(arch, distro, "php-common"),
            deb.package(arch, distro, "php-mbstring"),
            deb.package(arch, distro, "php-xml"),
            deb.package(arch, distro, "php-json"),
            deb.package(arch, distro, "php-curl"),
            deb.package(arch, distro, "php-gd"),
            deb.package(arch, distro, "php-intl"),
            deb.package(arch, distro, "php-zip"),
            deb.package(arch, distro, "composer"),
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
        name = ("php" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro + "_tarball",
        image = ("php" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro,
        repo_tags = [],
    )
    for mode in [":", ":debug"]
    for user in USERS
    for arch in ARCHITECTURES
    for distro in DISTROS
    if ("php" if mode == ":" else mode[1:]) + "_" + user + "_" + arch + "_" + distro != "php:_nonroot_amd64_debian12"
]
