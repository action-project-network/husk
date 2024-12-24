# HUSK

## Usage
```
./harvest WHICH_SILO WHICH_SEED WHICH_RECIPE WHICH_SCOPE
./harvest pqswan liboqs default publish
```

The **build as you go**, build system. Inspired by countless painful local builds

A "corn in a cob" philosophy for buliding softwares. Like a good-old corn husk, its meant to be modular, idempotent, and configurable.

1. Bob adds a module in the cob in the silo (a seed)
1.1 [Optional] Bob adds github credentials to the .bob file, required to clone github repos
3. Bob harvests the seed, a seed can be harvested per recipe (type of build), per scope (type of test)
4. The kern is sprouted in the .husk directory as s plug-and-play module

## Environment

*${HOME}/.husk*

## Configuration
COB - compilation of binaries

*${HOME}/husk/.cob*

### Contract
The WHICH_RECIPE can be anything, like *serial*, *parallel*, *bobsbuild*, etc, and is only meant for the *./sprout* script to identify the WHICH_RECIPE to make
```
{
    "<le-module>": {
        "source_url": "le-github-or-tarball-url",
        "checksum": "le-checksum",
        "source": "le-source-dir",
        "WHICH_RECIPE": {
            "<le-WHICH_RECIPE-name>": [
                "some make steps here maybe",
                "some python env install here maybe",
                "anything else"
            ]
        }
    }
}
```

