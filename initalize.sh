directory=`pwd`
for next in `ls home/`
do
    command="ln -s $directory/home/$next $HOME/.$next"
    echo $command
    eval $command
done
exit 0
