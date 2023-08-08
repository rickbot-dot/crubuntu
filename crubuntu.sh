# Load scripts
source sh/colors
source sh/menu

# Menu
while true; do
  # Clear the screen for a cleaner interface
  clear

  cecho yellow "Crubuntu 23.04 Setup"
  echo
  cat msg/welcome
  echo
  options=("Install Crubuntu" "Remove Crubuntu" "Help (Wiki, Google, etc)" "Exit Setup" "Advanced")

  select_option "${options[@]}"
  choice=$?

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
    read -set10 uninstall_conf
    if [[ $uninstall_conf == "CRUBUNTU" ]]; then
      echo "CRUBUNTU was entered!"
      echo "All data in the Crubuntu container will be removed."
      echo "This action is permanent and cannot be undone. Consider a backup first."
      echo "The user account you created will not be normal, and will be root,"
      echo "so you will need to create a new user and make it the default."
      echo "You will need to create a new container for Crostini."
      echo "On some setups Crostini may appear incompatible without a backup container."
      echo "Do you really want to remove Crubuntu?"
      options=("No" "Yes")

      select_option "${options[@]}"
      if [[ $? == 1 ]]; then
        lxc remove penguin
      fi
    fi
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

  # Advanced
  if [[ $choice == 4 ]]; then
    while true; do
      cecho red "Crubuntu 23.04 Setup"
      echo
      options=("Crostini Shell" "< Back")

      select_option "${options[@]}"
      choice=$?

      clear

      if [[ $choice == 0 ]]; then
        lxc exec penguin -- bash
      fi
      if [[ $choice == 1 ]]; then
        break
      fi
    done
  fi
done
