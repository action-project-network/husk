# HUSK
*A framework serving as a support*

* to build **reproducable**, **modular**, **reusable**, and **composable** scientific softwares

> https://ahdictionary.com/word/search.html?q=husk


## Pre-Requisite
1. Podman
2. Git
3. tar

### RHEL flavors
```bash
dnf install podman git tar
```

### Debian Flavors
```bash
apt install podman git tar
```

### MacOS

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/$(whoami)/.zprofile
echo 'eval "$(/usr/local/bin/brew shelling)"' >> /Users/$(whoami)/.zprofile
eval "$(/usr/local/bin/brew shellenv)"

brew install podman
brew install podman-desktop
podman machine init
podman machine start
 
brew install git
brew install gnu-tar
```


## Workflow
1. Run *base* once - sets the home directory
2. Collect the cob - compiles the cob and its dependencies to **.cob**
3. Farm and collect the simulation payload to **.farm**
4. Harvest the farmed payload into human friendly artifacts to **.harvest**

### An Example with SWIFT

We demonstrate how *husk* can be used to onboard onto *SWIFT* in 2 simple steps

https://github.com/SWIFTSIM/SWIFT

> SWIFT is a gravity and SPH solver designed to run cosmological simulations on peta-scale machines, scaling well up to 10's of thousands of compute node.

For Fedora
```bash
./base
./collect swift.standalone.cob fedora.soil
./collect swift.darkmatter.farm fedora.soil
./collect swift.darkmatter.harvest fedora.soil
```
For Ubuntu
```bash
./base
./collect swift.standalone.cob ubuntu.soil
./collect swift.darkmatter.farm ubuntu.soil
./collect swift.darkmatter.harvest ubuntu.soil
```

Respectively, building the simulation codebase, running the simulation and harvesting the payload each takes some time
Podman resource of 4 cores and at least 16GB of memory is recommended minimum
