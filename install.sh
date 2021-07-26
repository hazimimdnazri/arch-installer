#!/bin/bash
# Bash Menu Script Example

printf "\n"

guestQuest () {
    echo ""
    read -p "Are you a guest (y/n)? `echo $'\n> '`" guest
    case "$guest" in
        y|Y )
            carryOn;;
        n|N )
            echo "Automatic installation";;
        * )
            echo "Invalid election!";;
    esac

}

carryOn () {
	printf '\nPlease select your disk from the list by pressing the number: \n';
	lsblk -dno name | awk '{print NR,$0}'
    printf '\n';
    read -p'>' disk
    disk_val=$(lsblk -dno name | awk 'FNR=='$disk'{print NR,$0}')
    
    if [ -z "$disk_val" ]
    then
        echo "There is no disk numbered with $disk, please select another disk."
        carryOn
    else
        printf "\nSelect EFI partition"
    fi
}

carryOff () {
	echo "Chicken!";
}

read -p "Do you wish to install ArchLinux (y/n)? `echo $'\n> '`" choice
case "$choice" in
	y|Y ) 
		guestQuest;;
  	n|N ) 
		carryOff;;
  	* ) 
		echo "Invalid Option!";;
esac
