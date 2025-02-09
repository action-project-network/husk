# HUSK
*A framework serving as a support*

https://ahdictionary.com/word/search.html?q=husk

* to build **reproducable**, **modular**, **reusable**, and **composable** scientific softwares


## Pre-Requisite

1. Install podman *https://podman.io/docs/installation* 

    * Why Podman?
        * Daemon-less
        * Root-less

2. Git
    * if using seeds that reqiure *git clone*

## Adding seeds
1. This creates the directory *./silo/seeds/\<name>* and adds a file *\<version>.seed*
```shell
./seed <name> <url> <version>
```
2. Add to the **DEPENDENCIES** of the new seed with what is required to make the seed recipe
```
DEPENDENCIES=()
URL="https://some.package.archive"
CHECKSUM="sha256sum"
SOURCE="root-of-extracted-archive"
```
Some supported archive format are
1. *.tar.bz2*
2. *.tar.gz*
3. *.zip*

Git projects, i.e. git clone, are packaged as a *tar.gz* archive using the *.git* extension

## Workflow
Example:
```bash
./gather swiftsim.standalone
./spin swiftsim.standalone
./harvest swiftsim.standalone
./peek swiftsim.standalone
```