# Load scripts
source sh/colors
source sh/menu

# Clear the screen for more clean interface
clear

# Menu
while true; do
cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/welcome
echo
options=("Install Crubuntu" "Remove Crubuntu" "Help (Wiki, Google, etc)" "Exit Setup" "Advanced")

select_option "${options[@]}"
choice=$?
echo $choice
sleep 2

clear

# Installer
if [[ $choice == 0 ]]; then
cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/installer
echo
options=("Install Crubuntu 23.04 (Lunar / stable)" "Install Crubuntu 22.04 LTS (Jammy)" "Install Crubuntu 20.04 LTS (Focal)" "Install Crubuntu 23.10 Development Build (Lobster / unstable)" "< Back")

select_option "${options[@]}"
choice=$?
echo $choice
sleep 2
fi

# Uninstaller
if [[ $choice == 1 ]]; then
cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/uninstaller
echo
options=("< Back" "Uninstall Crubuntu")

select_option "${options[@]}"
choice=$?
echo $choice
sleep 2
fi

# Exit
if [[ $choice == 3 ]]; then
exit
fi

# Help
if [[ $choice == 2 ]]; then
cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/help
echo
read -N 1 -s -t 10
fi

clear
done
