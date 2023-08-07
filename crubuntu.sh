# Load scripts
source sh/colors
source sh/menu

# Clear the screen for more clean interface
clear

cecho yellow "Crubuntu 23.04 Setup"
echo
cat msg/welcome
echo
options=("Install Crubuntu" "Remove Crubuntu" "Upgrade" "Help (Wiki, Google, etc)" "Exit Setup" "Advanced")

select_option "${options[@]}"
choice=$?

echo "Choosen index = $choice"
echo "        value = ${options[$choice]}"
