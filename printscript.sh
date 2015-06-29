#!/bin/sh

TICKETNUMBER=''
LIST=''
PRINTNAME=''

main ()
{

    while getopts ":h" ARG
    do
        case $ARG in
            h)#print the help message
               print_help_message
              exit 0;;
        esac
    done
    case $1 in
      -p)
          PRINTNAME=$2;;
       *)
          command_not_found
          exit 20;;
    esac
    shift $(expr $OPTIND ) # shifts the remaining arguments
    if [ ! -z "$1" ]; then 
       command_not_found
       exit 50; 
    fi

    #program call
    return
}

command_not_found ()
{
	cat <<-EOF
	


COMMAND NOT FOUND
---------------Try Again-----------------


	EOF
    return
}

print_help_message()
{
	cat <<-EOF
	

Usage: $(basename $0) [OPTION] ..
	Run a print script after finding all the tickets from SNOT

	OPTIONS:	
	   -h        Display this help message
	   -p        Print your name on the test sheet


	EOF
    return
}
main $@
exit 0
