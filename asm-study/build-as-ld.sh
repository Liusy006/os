rmFile(){
	if [ -f $1 ]; then
		rm $1
		echo "rm $1"
	fi
}

checkFile(){
	if [ ! -f $1 ]; then
		echo "$1 is not exist"
		exit
	fi
}

if [ $# != 1 ]; then
	echo "USAGE: $0 <target file name>."
	exit
fi

rmFile $1.o
rmFile $1 

as -o $1.o $1.s
checkFile $1.o

ld -o $1 $1.o
checkFile $1 

rmFile cpuid.o
