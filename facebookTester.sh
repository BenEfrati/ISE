#!/bin/bash
Output="*******************"
Output+="Excpected Output"
Output+="******************"
Menu(){
	while true; do 
	    clear
		echo "**************"
		echo "Facebook App Tester"
		echo "**************"
		echo "Please select an option"
		echo "0) Build prog (with Makefile) "
		echo "1) Run prog with valgrind"
		echo "2) Add users to facebook "
		echo "3) delete users from facebook "
		echo "4) Generate friendship"
		echo "5) Delete friendship "
		echo "6) Find mutual friends"
		echo "7) find viral"
		echo "8) exit"
		echo "9) ofek viral"
		read -p 'Option:' -n 1 option
		# drops one line
		echo ""
		# That's how a 'switch'	looks like in bash
		case $option in
			0) build ;;
			1) run ;;
			2) addUser ;;
			3) deleteUser ;;
			4) addFriend ;;
			5) deleteFriend ;;
			6) mutual ;;
			7) viral ;;
			8)	exit ;;
			9) viral2 ;;
			*) echo "Please type a valid option" ; sleep 1 ;; 
		esac
	done
}
build(){
    make
    read -p 'Press any key to continue...' -n 1 io
}
run(){
    valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    read -p 'Press any key to continue...' -n 1 io
}

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}
addUser(){
    x=97
    y=98
    Users=""
    for((i=0;i<25;i++))
    do
    Users+="2\n"
    Users+="$i\n"
    done
    Users+="1\n8\n"
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "You should see 25 Users"
    read -p 'Press any key to continue...' -n 1 io
}
deleteUser(){
    x=97
    y=98
    Users=""
    for((i=0;i<24;i++))
    do
    Users+="2\n"
    Users+="$i"
    Users+="\n"
    done
    Users+="1\n3\n"
    for((i=1;i<25;i++))
    do
    Users+="$i\n3\n"
    done
    Users+="25\n8\n"
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "You should see friend list only one time"
    read -p 'Press any key to continue...' -n 1 io
}
addFriend(){
    Users=""
    for((i=0;i<25;i++))
    do
    Users+="2\n"
    Users+="$i\n"
    done
    for((i=1;i<26;i++))
    do
        for((j=1;j<26;j++))
        do
        Users+="4\n$i\n$j\n"
        done
    done
    Users+="1\n8\n"
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "You should see 25 Users, each user has 24 friends"
    read -p 'Press any key to continue...' -n 1 io
}
deleteFriend(){
    for((i=0;i<25;i++))
    do
    Users+="2\n"
    Users+="$i\n"
    done
    for((i=1;i<26;i++))
    do
        for((j=1;j<26;j++))
        do
        Users+="4\n$i\n$j\n"
        done
    done
    for((i=1;i<26;i++))
    do
        for((j=1;j<26;j++))
        do
        Users+="5\n$i\n$j\n"
        done
    done
    Users+="1\n8\n"
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "You should see 25 Users, each user has no friends"
    read -p 'Press any key to continue...' -n 1 io
}
mutual(){
    Users="2\nori\n2\nben\n2\ndaniel\n2\nrami\n2\nroni\n2\nsami\n2\nmatan\n2\nroee\n2\noffer\n2\nsagi\n2\nkarim\n4\n1\n2\n4\n1\n3\n4\n1\n4\n4\n5\n3\n4\n8\n2\n1\n6\n1\n2\n3\n0\n8\n"
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "Common friends:"
    echo "User: ori       ID: 1"
    echo "Note: There are no common friends is also good output"
    read -p 'Press any key to continue...' -n 1 io
}
viral(){
    n="\n"
    add="\n2$n"
    friend="4$n"
    Users="$add"
    Users+="1$add"
    Users+="2$add"
    Users+="3$add"
    Users+="4$add"
    Users+="5$add"
    Users+="6$add"
    Users+="7$add"
    Users+="8$add"
    Users+="9$add"
    Users+="10$add"
    Users+="11$n"
    Users+="$friend"
    Users+="11$n"
    Users+="4$n"
    Users+="$friend"
    Users+="11$n"
    Users+="1$n"
    Users+="$friend"
    Users+="10$n" 
    Users+="1$n"
    Users+="$friend"
    Users+="10$n"
    Users+="2$n"
    Users+="$friend"
    Users+="10$n" 
    Users+="3$n"
    Users+="$friend"
    Users+="2$n" 
    Users+="7$n"
    Users+="$friend" 
    Users+="2$n" 
    Users+="5$n"
    Users+="$friend"
    Users+="5$n" 
    Users+="9$n"
    Users+="$friend"
    Users+="5$n" 
    Users+="6$n"
    Users+="$friend"
    Users+="6$n" 
    Users+="3$n"
    Users+="$friend"
    Users+="2$n"
    Users+="3$n"
    Users+="$friend"
    Users+="6$n"
    Users+="8$n"
    Users+="$friend"
    Users+="7$n"
    Users+="9$n"
    Users+="1$n"
     Users+="7$n"
    Users+="8$n"
    
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "the viral path should contain 11 users"
    read -p 'Press any key to continue...' -n 1 io
}
viral2(){
    Users=""
    for((i=0;i<25;i++))
    do
    Users+="2\n"
    Users+="$i\n"
    done
    Users+="1\n"
    Users+="4\n6\n25\n4\n21\n23\n4\n1\n22\n4\n10\n11\n4\n17\n9\n4\n16\n23\n4\n20\n4\n4\n1\n23\n4\n7\n5\n4\n24\n8\n4\n20\n5\n4\n20\n9\n4\n3\n6\n4\n25\n4\n4\n2\n1\n4\n17\n3\n4\n3\n20\n4\n22\n21\n4\n14\n15\n4\n12\n7\n4\n11\n3\n4\n21\n10\n4\n7\n8\n4\n14\n5\n4\n19\n16\n4\n21\n25\n4\n18\n20\n4\n13\n9\n4\n16\n9\n4\n4\n4\n4\n13\n13\n4\n8\n22\n4\n11\n19\n4\n2\n12\n4\n6\n10\n4\n16\n21\n4\n7\n6\n4\n6\n8\n4\n12\n5\n4\n11\n16\n4\n7\n25\n4\n18\n3\n4\n1\n25\n4\n5\n11\n4\n1\n5\n4\n22\n17\n4\n5\n24\n4\n8\n21\n4\n6\n11\n4\n12\n3\n1\n7\n8\n"
    echo "***Note: this test takes a few minutes"
    sleep 5
    printf $Users | valgrind --tool=memcheck --leak-check=full --track-origins=yes ./facebook
    echo "$Output"
    echo "the viral path should contain 25 users"
    read -p 'Press any key to continue...' -n 1 io
}

Menu
