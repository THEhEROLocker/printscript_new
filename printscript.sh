#!/bin/sh

TICKETNUMBER=''
PRINTERLIST=''
PRINTNAME=''
DATE=$(date +%d-%b)

main ()
{

    while getopts ":p:h" ARG
    do
        case $ARG in
             h)#print the help message
               print_help_message
               exit 0;;

             p)
               PRINTNAME=$OPTARG;;

             ?)
              command_not_found
              exit 20;;
      esac
    done
    shift $(expr $OPTIND - 1  ) # shifts the remaining arguments

		if [[ ! -z "$1" ]] || [[ -z $PRINTNAME ]]; then 
       command_not_found
       exit 20;
    fi

    #program call
    print_awk
    return
}

command_not_found ()
{
	cat <<-EOF
	


           INVALID COMMAND 

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

print_awk()
{
		SNOT=$(snot -l)
    echo $SNOT
}

main $@
exit 0;
