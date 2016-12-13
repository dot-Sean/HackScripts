#! /bin/bash
clear
echo "This script will be executed in Linux. Please run as root for better results."
printf "\n\n"
echo "############################################################################"
echo "############################################################################"
printf "\n\n"
echo "Enter the number of directory paths you want to search:"
read number
printf "\n\n"
num=$[$number - 1]
for i in `seq 0 $num`
do	
echo "Enter the directory path to search:"
read path
printf "\n\n"
if [ -z "$path" ]
then
echo "Empty string"
printf "\n"
exit
fi
cd "$path"
echo "Enter the file type to search(.format):"
read format
printf "\n\n"
if [ -z "$format" ]
then
echo "Empty String"
printf "\n"
exit
fi
clear
printf "\n\n"
echo "##############################################################################################################"
printf "\n\n"
ls -l -s -R | grep -i -s -e "$format\$" | awk '{print $10 " " $7 " " $8 " " $9 " " $1 " Bytes"}' | sort -d | column -t
printf "\n\n"
echo "##############################################################################################################"
printf "\n\n"
echo "Do you want to delete a file(Y/N)?"
read option
printf "\n\n"
if [ -z "$option" ]
then
echo "Empty String"
printf "\n"
exit
fi
case $option in
y|Y) { echo "Enter the number of files you want to delete:"
read filenum
if [ -z "$filenum" ]
then
echo "Empty String"
printf "\n"
exit
fi
printf "\n\n"
case $filenum in
0) echo "No files will be deleted"
continue;;
*) for i in `seq 1 $filenum`;do
echo "Enter the file name to be deleted:"
read filename
printf "\n\n"
echo "The path(s) of the filename is:"
echo -n "`find $PWD -name $filename`"
printf "\n\n"
delnum=`find $PWD -name $filename | wc -l`
case $delnum in
0) echo "No Files"
break;;
1) out=`find $PWD -name $filename`
dirnam=${out%/*}
cd $dirnam
rm -i "$filename"
printf "\n"
cd $path;;
*) echo "Enter the file number of file to be deleted:"
read value
printf "\n\n"
out=`find $PWD -name $filename | awk 'NR=='$value`
dirnam=${out%/*}
cd $dirnam
rm -i "$out"
printf "\n"
cd $path;;
esac
done;;
esac
};;
n|N)echo "Files will not be deleted"
printf "\n\n" ;;
*)echo "Invalid Input"
printf "\n\n" ;;
esac
done
