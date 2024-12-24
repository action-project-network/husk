{
    "fftw": {
        "url": "fftw.org/fftw-3.3.10.tar.gz",
        "checksum": "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467",
        "source": "fftw-3.3.10",
        "recipe": {
            "serial": [
                "./configure --prefix=${HOME}/.husk/",
                "make && make check && make installcheck && make install"
            ]
        }
    },
    "gsl": {
        "url": "git.savannah.gnu.org/cgit/gsl.git/snapshot/gsl-release-2-8.tar.gz",
        "checksum": "9a8905b4d07ce8cda5b97ad8bdb40e953f31e55b6ebe406a5b8a1213e754ca05",
        "source": "gsl-release-2-8",
        "recipe": {
            "serial": [
                "./autogen.sh && ./configure --prefix=${HOME}/.husk/",
                "make && make check && make installcheck && make install"
            ]
        }
    },
    "openmpi": {
        "url": "download.open-mpi.org/release/open-mpi/v5.0/openmpi-5.0.6.tar.bz2",
        "checksum": "bd4183fcbc43477c254799b429df1a6e576c042e74a2d2f8b37d537b2ff98157",
        "source": "openmpi-5.0.6",
        "recipe": {
            "serial": [
                "./configure --prefix=${HOME}/.husk/",
                "make -j12 all && make install"
            ]
        }
    },
    "hdf5": {
        "url": "",
        "checksum": "ec2e13c52e60f9a01491bb3158cb3778c985697131fc6a342262d32a26e58e44",
        "recipe": {
            "serial-with-zlib": [
                "./configure --prefix=${HOME}/.husk/ --with-zlib=${HOME}/.husk/local/include,${HOME}/.husk/local/lib --enable-build-mode=production --enable-parallel",
                "make && make check && make install && make check-install"
            ],
            "tree": [
                "CC=${HOME}/.husk/local/bin/mpicc CPPFLAGS=-I${HOME}/.husk/local/include LDFLAGS=-L${HOME}/.husk/local/lib ./configure --prefix=${HOME}/.husk/ --with-zlib=${HOME}/.husk/local/include,${HOME}/.husk/local/lib --enable-build-mode=production --enable-parallel",
                "make && make check && make install && make check-install"
            ]
        }
    }
}