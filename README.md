# HUSK
*A framework serving as a support*

* to build **reproducable**, **modular**, **reusable**, and **composable** scientific softwares

> https://ahdictionary.com/word/search.html?q=husk


## Pre-Requisite
1. Podman
2. Git
3. tar

Fedora
```bash
dnf install podman git tar
```

Ubuntu
```bash
apt install podman git tar
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
./collect swiftsim.standalone.cob fedora.soil
./collect swiftsim.darkmatter.farm fedora.soil
# WIP ./collect swiftsim.darkmatter.harvest fedora.soil
```
For Ubuntu
```bash
./base
./collect swiftsim.standalone.cob ubuntu.soil
./collect swiftsim.darkmatter.farm ubuntu.soil
# WIP ./collect swiftsim.darkmatter.harvest ubuntu.soil
```