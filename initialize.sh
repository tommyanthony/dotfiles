# Install oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
# Symlink dotfiles
directory=`pwd`
for next in `ls home/`
do
    command="ln -s $directory/home/$next $HOME/.$next"
    echo $command
    eval $command
done
exit 0
