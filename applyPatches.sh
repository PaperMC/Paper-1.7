#!/bin/bash

PS1="$"
basedir=`pwd`
gitcmd="git -c commit.gpgsign=false"

echo "Rebuilding Forked projects.... "

function applyPatch {
    what=$1
    target=$2
    cd "$basedir/$what"
    $gitcmd branch -f upstream >/dev/null

    cd "$basedir"
    if [ ! -d  "$basedir/$target" ]; then
        $gitcmd clone $1 $target -b upstream
    fi
    cd "$basedir/$target"
    echo "Resetting $target to $what..."
    $gitcmd remote rm upstream 2>/dev/null 2>&1
    $gitcmd remote add upstream ../$what >/dev/null 2>&1
    $gitcmd checkout master >/dev/null 2>&1
    $gitcmd fetch upstream >/dev/null 2>&1
    $gitcmd reset --hard upstream/upstream
    echo "  Applying patches to $target..."
    $gitcmd am --abort
    $gitcmd am --3way "$basedir/${what}-Patches/"*.patch
    if [ "$?" != "0" ]; then
        echo "  Something did not apply cleanly to $target."
        echo "  Please review above details and finish the apply then"
        echo "  save the changes with rebuildPatches.sh"
        exit 1
    else
        echo "  Patches applied cleanly to $target"
    fi
}
echo
echo "Applying SpigotMC patches to CraftBukkit and Bukkit"
echo
applyPatch Bukkit Spigot-API && applyPatch CraftBukkit Spigot-Server
echo
echo "Applying PaperSpigot patches to Spigot-Server and Spigot-API"
echo
applyPatch Spigot-API PaperSpigot-API && applyPatch Spigot-Server PaperSpigot-Server