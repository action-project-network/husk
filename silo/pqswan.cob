{
    "liboqs": {
        "prep": {
            "build": "openssl-devel astyle cmake gcc ninja-build",
            "test": "python3-pytest python3-pytest-xdist python3-yaml",
            "publish": "unzip xsltproc doxygen graphviz valgrind"
        },
        "url": "github.com/open-quantum-safe/liboqs.git",
        "source": "liboqs",
        "recipe": {
            "default": [
                "mkdir -p build && cd build",
                "cmake -GNinja -DCMAKE_INSTALL_PREFIX=/.husk/.harvest/ .. && ninja",
                "ninja run_tests",
                "ninja install"
            ]
        }
    }
}