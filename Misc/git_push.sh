git add *
echo "Enter the message for commit"
read message
git commit -a -m "$message"
git push origin master
