#!/usr/bin/env bash

basedir="$(cd "$1" && pwd -P)"

cp ./PaperSpigot-Server/target/paperspigot*-SNAPSHOT.jar ./Paperclip/paperspigot-1.7.10.jar
cd ./Paperclip

# 1.7 build scripts did not rely on the _original_ vanilla 1.7.10 jar, so we want to grab it from mojang.
if [ ! -f "./minecraft_server.1.7.10.jar" ]; then
    echo "Local vanilla jar not found; downloading..."
    curl -o "./minecraft_server.1.7.10.jar" "https://launcher.mojang.com/v1/objects/952438ac4e01b4d115c5fc38f891710c4941df29/server.jar"
    if [ $? -ne 0 ]; then
        echo "Failed to download minecraft server jar!"
        exit 1
    fi
fi

current_sha1="$(sha1sum "./minecraft_server.1.7.10.jar" | awk '{print $1}')"
if [ "$current_sha1" != "952438ac4e01b4d115c5fc38f891710c4941df29" ]; then
    echo "1.7.10 server jar does not match expected SHA1 checksum! Download issue?"
    echo "    Expected: 952438ac4e01b4d115c5fc38f891710c4941df29"
    echo "      Actual: $current_sha1"
    echo "You may want to delete and re-download the 1.7.10 vanilla jar file."
    exit 1
fi

# To avoid maintaining yet another fork of a ... have sed update urls
# maven http block in newer versions, rewrite to https
# papermc maven repo has moved, rewrite to new url
find . -name "pom.xml" -print0 | xargs -0 sed -i \
    -e 's|http://|https://|g' \
    -e 's|https://papermc.io/repo/|https://repo.papermc.io/|g'

mvn clean package -Dmcver=1.7.10 "-Dpaperjar=$basedir/Paperclip/paperspigot-1.7.10.jar" "-Dvanillajar=$basedir/Paperclip/minecraft_server.1.7.10.jar"
cd ..
cp ./Paperclip/assembly/target/paperclip*.jar ./paperclip.jar

echo ""
echo ""
echo ""
echo "Build success!"
echo "Copied final jar to $(pwd)/paperclip.jar"
