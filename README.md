Paper(Spigot) 1.7
=================

THIS REPO AND VERSION ARE DEPRECATED. NEITHER WILL BE SUPPORTED ANY LONGER.
===========================================================================

Original readme
-----------------------------------------------------

High performance Spigot fork that aims to fix gameplay and mechanics inconsistencies.

DO NOT BUG US FOR SUPPORT FOR 1.7.10. YOU WILL NOT GET ANY.

Due to the age of this repo, you must use Java 8 and Maven 3.


How To Build
------------

Init the submodules : `git submodule update --init`

Apply Patches : `./applyPatches.sh`

Using Java 8 and [Maven 3](http://maven.apache.org/download.html) run : `mvn clean install`

To build a distributable jar, execute : `./paperclip.sh`


How to Develop
--------------

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
