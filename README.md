PaperSpigot 1.7[![Travis Status](https://travis-ci.org/PaperSpigot/PaperSpigot.svg?branch=master)](https://travis-ci.org/PaperSpigot/PaperSpigot)
===========

THIS REPO AND VERSION ARE DEPRECATED. NEITHER WILL BE SUPPORTED ANY LONGER.
===========================================================================

We will no longer support PaperSpigot 1.7.10 in any capacity. Given the upcoming release of Minecraft 1.9, and the age of 1.7.10 and its numerous feature and security flaws, it is no longer worth our time to support it in any capacity whatsoever. It is assumed that if you choose to run this outdated version, you know what you're doing and are capable of fixing any issues yourself. Those of you who chose to continue using it, and that plan to continue work with the source, are recommended to fork this repo now, as this official repo will recieve no more support.

The only potential exception is for security backports, and even then, they will be provided at-will, and should not be expected.

We recommend users update to 1.8.8, available [here](https://hub.spigotmc.org/stash/projects/PAPER). If that is not an option we, at the very least, recommend jumping ship to 1.9 as soon as it is available. Either way, we're done with 1.7.10. So long, and thanks for all the fish.







Original readme
-----------------------------------------------------

High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.

DO NOT BUG US FOR SUPPORT FOR 1.7.10. YOU WILL NOT GET ANY.

[IRC Support and Project Discussion](http://irc.spi.gt/iris/?channels=PaperSpigot)

The 1.8 codebase can be found on [SpigotMC's Stash Service here](https://hub.spigotmc.org/stash/projects/PAPER). This repo contains the 1.7 and 1.7.10 with protocol patch codebase.

How To
-----------

Init the submodules : `git submodule update --init`

Apply Patches : `./applyPatches.sh`

### Create patch for server ###

`cd PaperSpigot-Server`

Add your file for commit : `git add <file>`

Commit : `git commit -m <msg>`

`cd ..`

Create Patch `./rebuildPatches.sh`

### Create patch for API ###

`cd Paperspigot-API`

Add your file for commit : `git add <file>`

Commit : `git commit -m <msg>`

`cd ..`

Create Patch `./rebuildPatches.sh`




Compilation
-----------

We use maven to handle our dependencies.

* Install [Maven 3](http://maven.apache.org/download.html)
* Clone this repo and: `mvn clean install`
