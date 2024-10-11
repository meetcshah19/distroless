"install debian packages"

load("@bookworm//:packages.bzl", "bookworm_packages")
load("@bookworm_java//:packages.bzl", "bookworm_java_packages")
load("@bookworm_python//:packages.bzl", "bookworm_python_packages")
load("@bookworm_postgres//:packages.bzl", "bookworm_postgres_packages")

def packages():
    "install debian packages"
    bookworm_packages()
    bookworm_java_packages()
    bookworm_python_packages()
    bookworm_postgres_packages()    
