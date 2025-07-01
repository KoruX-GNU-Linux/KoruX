#!/bin/sh

# FIXME: In the future, it will be possible to use play.it from the official
# repository, but for now, Diablo II is not yet included in
# https://salsa.debian.org/games-team/play.it

set -e

if [ "$(id -u)" -eq 0 ]; then
	>&2 echo "Please, execute this script as a non-root user."
	exit 1
fi

umask 022

download_data_files()
{
sshpass -p '1' sftp sftpuser@5.63.158.181 <<EOF
lcd data
cd diablo2
get -r *
bye
EOF
}

git clone --branch main --depth 1 http://git.vv221.fr/play.it-vv221 play.it-tmp
cd play.it-tmp/games/
mkdir data

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
	chmod 700 ~/.ssh
fi

# know this host (SFTP server with game data files)
sftpip="5.63.158.181"
if ! ssh-keygen -F "$sftpip" >/dev/null 2>&1; then
	ssh-keyscan -H "$sftpip" >> ~/.ssh/known_hosts
fi

# download game data files from SFTP server
echo
echo "Data files extracted from:"
echo "Downloader_Diablo2_enUS.exe"
echo "Downloader_Diablo2_Lord_of_Destruction_frFR.exe"
echo
download_data_files

# generate Diablo II packages
smpq --extract data/d2data.mpq
mv data/global/sfx/cursor/curindx.wav data/D2/
mv data/global/sfx/cursor/wavindx.wav data/D2/
./play-diablo-2.sh data/D2/Installer\ Tome.mpq
rm diablo-2-data-shared_*.deb
mv ./*.deb "$OLDPWD"

# generate Diablo II LoD packages
smpq --extract data/d2char.mpq
mv data/d2char.mpq data/D2LOD/
mv data/global/sfx/cursor/curindx.wav data/D2LOD/
mv data/global/chars/am/cof/amblxbow.cof data/D2LOD/
./play-diablo-2-expansions.sh data/D2LOD/Installer\ Tome.mpq
mv ./*.deb "$OLDPWD"

cd -
rm -rf play.it-tmp
sudo apt install -y ./*.deb
sudo rm ./*.deb

# delete host
ssh-keygen -R "$sftpip" >/dev/null 2>&1
