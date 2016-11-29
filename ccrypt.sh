#! /bin/bash
clear
echo "#############################################"
echo "File Encryptor using CCrypt"
echo "Written by vduddu"
echo "#############################################"
printf "\n\n\n"
echo "Do you have ccrypt installed on your System?(Y/N):"
printf "\n\n"
read inp
case $inp in
y|Y){
out="$(uname -a |awk '{print $1}')"
if [ "$out" = 'Linux' ]
then
echo "You are using Linux"
sudo apt-get get update
sudo apt-get install ccrypt -y
fi
if [ "$out" = 'Darwin' ]
then
echo "You are using Mac OSX"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install ccrypt
fi };;
n|N)printf "\n\n\n"
echo "You will be redirected to the menu";;
esac
printf "\n\n\n"
while :
do
echo "Enter the number corresponding to the option you want to perform"
printf "\n"
echo "1.Encrypt a file"
echo "2.Decrypt a file"
echo "3.Change the key"
echo "4.Exit"
printf "\n\n"
read val
printf "\n\n"
echo "Format for enetering directory path:"
echo "Linux user: /home/{username}/{Desktop,Documents,Downloads...}"
echo "Mac Users: /Users/{username}/{Desktop,Documants,Downloads...}"
printf "\n\n"
case "$val" in
1) echo "Enter the directory path to search:"
read path
printf "\n\n"
if [ -z "$path" ]
then
echo "Empty string"
printf "\n"
exit
fi
cd "$path"
printf "\n\n"
echo "#########################################"
ls -l | awk '{print $9}'
echo "#########################################"
printf "\n\n"
echo "Enter the file name to be encrypted:"
read filename
printf "\n\n"
ccrypt -q -e $filename
if [ $? -ne 0 ]
then
echo "Error"
else
echo "Encryption successful"
fi
;;
2) echo "Enter the directory path to search:"
read path
printf "\n\n"
if [ -z "$path" ]
then
echo "Empty string"
printf "\n"
exit
fi
cd "$path"
printf "\n\n"
echo "#########################################"
ls -l | awk '{print $9}'
echo "#########################################"
printf "\n\n"
echo "Enter the file name to be decrypted:"
read filename
printf "\n\n"
ccrypt -q -d $filename
if [ $? -ne 0 ]
then
echo "Error"
else
echo "Decryption Successful"
fi
;;
3) echo "Enter the directory path to search:"
read path
printf "\n\n"
if [ -z "$path" ]
then
echo "Empty string"
printf "\n"
exit
fi
cd "$path"
printf "\n\n"
echo "#########################################"
ls -l | awk '{print $9}'
echo "#########################################"
printf "\n\n"
echo "Enter the encrypted file name whose key is to be changed:"
read filename
printf "\n\n"
ccrypt -q -x $filename
if [ $? -ne 0 ]
then
echo "Error"
else
echo "Key successfully changed"
fi
;;
4) echo "Good bye!!"
exit;;
esac
done
