{
    "veloc": {
        "url": "github.com/ECP-VeloC/VELOC/archive/refs/tags/veloc-1.7.tar.gz",
        "checksum": "ca50cb300830ea7f7e5679d32e3671ce4ea250eac384e7231def8dbb90e0cf31",
        "source": "VELOC-veloc-1.7",
        "recipe": {
            "serial": [
                "python",
                "./bootstrap.sh",
                "./auto-install.py ${HOME}/.husk/"
            ]
        }
    },
    "genericio": {
        "url": "git.cels.anl.gov/hacc/genericio.git",
        "source": "genericio",
        "needs": [
            "openmpi"
        ],
        "recipe": {
            "parallel": [
                "make MPICC=${HOME}/.husk/bin/mpicc MPICXX=${HOME}/.husk/bin/mpicxx -j12",
                "source ${HOME}/.husk/.venv/bin/activate && pip install ."
            ]
        }
    }
}