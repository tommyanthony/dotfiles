directory=`pwd`
for next in `ls home/`
do
    echo "ln -s $directory/home/$next $HOME/.$next"
done
exit 0  
