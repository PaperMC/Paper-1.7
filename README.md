PaperSpigot [![Travis Status](https://travis-ci.org/PaperSpigot/PaperSpigot.svg?branch=master)](https://travis-ci.org/PaperSpigot/PaperSpigot)
===========

High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.

[IRC Support and Project Discussion](http://irc.spi.gt/iris/?channels=PaperSpigot)

The 1.8+ codebase can be found on [SpigotMC's Stash Service here](https://hub.spigotmc.org/stash/projects/PAPER). This repo contains the 1.7 and 1.7.10 with protocol patch codebase. The finer details of support and maintenance are still being worked out.

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
