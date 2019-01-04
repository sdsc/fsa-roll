# SDSC "fsa" roll

## Overview

This roll bundles the FSA, Mummer, and AMOS sequence alignment packages.

For more information about the various packages included in the fsa roll please visit their official web pages:

- <a href="http://fsa.sourceforge.net" target="_blank">FSA</a> is probabilistic
multiple sequence alignment algorithm which uses a "distance-based" approach to
aligning homologous protein, RNA or DNA sequences.
- <a href="http://mummer.sourceforge.net" target="_blank">MUMMER</a> is a system
for rapidly aligning entire genomes, whether in complete or draft form.
- <a href="http://sourceforge.net/projects/amos/" target="_blank">AMOS</a> is  a
collection of tools and class interfaces for the assembly of DNA reads.


## Requirements

To build/install this roll you must have root access to a Rocks development
machine (e.g., a frontend or development appliance).

If your Rocks development machine does *not* have Internet access you must
download the appropriate fsa source file(s) using a machine that does
have Internet access and copy them into the `src/<package>` directories on your
Rocks development machine.

The latest version of amos is 8 years old. It does not compile with intel 2018 or gnu 4.8.5 and above. It will compile with pgi 17.5. Therefore the pgi roll is required


## Dependencies

The sdsc-roll must be installed on the build machine, since the build process
depends on make include files provided by that roll.


## Building

To build the fsa-roll, execute this on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make 2>&1 | tee build.log
```

A successful build will create the file `fsa-*.disk1.iso`.  If you built the
roll on a Rocks frontend, proceed to the installation step. If you built the
roll on a Rocks development appliance, you need to copy the roll to your Rocks
frontend before continuing with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll fsa
% cd /export/rocks/install
% rocks create distro
```

Subsequent installs of compute and login nodes will then include the contents
of the fsa-roll.  To avoid cluttering the cluster frontend with unused
software, the fsa-roll is configured to install only on compute and
login nodes. To force installation on your frontend, run this command after
adding the fsa-roll to your distro

```shell
% rocks run roll fsa host=NAME | bash
```

where NAME is the DNS name of a compute or login node in your cluster.

In addition to the software itself, the roll installs fsa environment
module files in:

```shell
/opt/modulefiles/applications/fsa
```


## Testing

The fsa-roll includes a test script which can be run to verify proper
installation of the roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/fsa.t 
```
