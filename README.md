# HUSK
The **build as you go**, build system. Inspired by countless painful local builds

## Pre-Requisite

1. Install podman *https://podman.io/docs/installation* 

Why Podman?
* Daemon-less
* Root-less

## Adding seeds
1. Create a new directory in the *silo* for the *seed*
```shell
./husk/silo/seeds/<WHICH_SEED>/
```
2. Add a *<WHICH_VERSION>.seed* file in the format
```json
DEPENDENCIES=(gcc)
URL="source-domain.name/archive.format"
CHECKSUM="sha256sum"
SOURCE="extracted-folder"
```
Some supported archive format are
1. *.tar.bz2*
2. *.tar.gz*
3. *.zip*

## Usage

### What are Pods?
**Pods** are the canonical terms that determines the name of the *Podman* container. A pod name usually contains the format *package.recipe*

### What is rake?
The *./rake* script takes this canonical name and translates this to other variables. The *.rake* script is used to initialize *husk* scripts.

### Workflow
```bash
./gather <WHICH_POD>
./spin <WHICH_POD>
./harvest <WHICH_POD>
./peek <WHICH_POD>
```
Example:
```bash
./gather swiftsim.serial
./spin swiftsim.serial
./harvest swiftsim.serial
./peek swiftsim.serial
```

### Dependency Resolution
Per the example, we need *silo/cobs/swiftsim/serial.cob* populated with the seeds. Provided that the needs of the seeds are completely specified, this step is automated by the *./gather* script by simply specifiying the meta-seed.

For example, if the contents of *silo/cobs/swiftsim/serial.cob* is:
```bash
COB=(swiftsim_latest_serial)
```
Executing *./gather swiftsim.serial*, yields

```bash
COB=(zlib_latest_serial hdf5_latest_serial openmpi_latest_serial fftw_latest_serial gklib_latest_serial metis_latest_serial gsl_latest_serial numa_latest_serial jemalloc_latest_serial swiftsim_latest_serial)
REQUIREMENTS="sh tar unzip gcc g++ autoconf automake @development-tools libtool cmake"
```
The requirements in this case are the packages required to build the package. The order of the build is also important, and the *./gather* script resolves this for us in order of precedence.

## Debugging
Should the pod exit prematurely for whatever reason, simply revive the pod and enter it's shell and debug away.
```bash
./revive swiftsim.serial
./enter swiftsim.serial
```

### Continuation
1. Archives are cached per checksum
2. If a seed is installed to the cob using the *./sprout* script successfully, and then a following seed fails, rerunning *./harvest* resumes from the failed seed