#!/bin/bash
# nrobinson2000/pi400-base [WIP]

# To install as a non-root user:
# git clone https://github.com/nrobinson2000/pi400-base
# cd pi400-base
# ./install.sh

# DOTFILES_AGREE="true"

if [[ "$DOTFILES_AGREE" != "true" ]]; then
    echo "To confirm that you understand the risks of this script you must uncomment"
    echo 'the DOTFILES_AGREE="true" line in install.sh'
    exit
fi

echo "Updating mirrorlist..."
sudo pacman-mirrors --country United_States || exit

echo "Updating system..."
sudo pacman -Syyu --noconfirm || exit

echo "Installing base-devel..."
sudo pacman -S --noconfirm --needed base-devel || exit

echo "Installing native packages..."
sudo pacman -S --noconfirm --needed - < packages/native || exit

echo "Installing AUR packages..."
yay -S --removemake --noconfirm --needed - < packages/aur || exit

echo "Cleaning up..."
sudo pacman -Rcns --noconfirm $(pacman -Qqdtt)
yay -Sc --noconfirm

echo "Updating SSL certificates..."
sudo update-ca-trust

# Don't apply any customizations unless all packages were installed successfully

echo "Installing dwm-setstatus..."
pushd "src/dwm-setstatus"
make
sudo make install
popd

echo "Installing custom dwm and st..."
CWD="$PWD"
pushd "$HOME"
yay -G dwm-git st-git

pushd "dwm-git"
cp -f "$CWD/src/dwm/config.h" "config.h"
makepkg -Asif
popd

pushd "st-git"
cp -f "$CWD/src/st/config.h" "config.h"
makepkg -Asif
popd

popd # $HOME

echo "Installing vim-plug..."
mkdir -p "$HOME/.vim/autoload"
curl -fLo "$HOME/.vim/autoload/plug.vim" \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo "Applying customizations..."
cp -r $(find skel -maxdepth 1 | tail +2) "$HOME"

echo "Applying config.txt..."
sudo mv "/boot/config.txt" "/boot/config.txt.orig"
sudo cp "boot/config.txt" "/boot"

echo "Finished installation."
echo "Please reboot for all changes to take effect."

echo "To complete the installation of vim-plug run the following:"
echo "vim -c PlugInstall"
