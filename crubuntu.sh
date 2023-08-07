# Load scripts
source sh/colors
source sh/menu

# Clear the screen for more clean interface
clear

cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/welcome
echo
options=("Install Crubuntu and Remove Debian" "Remove Crubuntu and Install Debian" "Wiki" "Google (for help)" "Exit Setup" "[Advanced] Termina Shell")

select_option "${options[@]}"
choice=$?

echo "Choosen index = $choice"
echo "        value = ${options[$choice]}"
