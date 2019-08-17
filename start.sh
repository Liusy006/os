checkFile(){
	if [ ! -f $1 ] ; then
		echo " error : $1 is not exist."
		exit
	fi
}
nasm boot.asm -f bin -o boot.bin
checkFile boot.bin
qemu boot.bin
