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


## Dependencies

Unknown at this time.


## Building

To build the fsa-roll, execute these instructions on a Rocks development
machine (e.g., a frontend or development appliance):

```shell
% make default 2>&1 | tee build.log
% grep "RPM build error" build.log
```

If nothing is returned from the grep command then the roll should have been
created as... `fsa-*.iso`. If you built the roll on a Rocks frontend then
proceed to the installation step. If you built the roll on a Rocks development
appliance you need to copy the roll to your Rocks frontend before continuing
with installation.


## Installation

To install, execute these instructions on a Rocks frontend:

```shell
% rocks add roll *.iso
% rocks enable roll fsa
% cd /export/rocks/install
% rocks create distro
% rocks run roll fsa | bash
```

In addition to the software itself, the roll installs fsa environment
module files in:

```shell
/opt/modulefiles/applications/fsa.
```


## Testing

The fsa-roll includes a test script which can be run to verify proper
installation of the fsa-roll documentation, binaries and module files. To
run the test scripts execute the following command(s):

```shell
% /root/rolltests/fsa.t 
ok 1 - fsa is installed
ok 2 - fsa test run
ok 3 - fsa module installed
ok 4 - fsa version module installed
ok 5 - fsa version module link created
1..5
```
