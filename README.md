All my dotfiles for when I set up VIM and bash on a new machine.

mac.sh installs software and packages via homebrew for the Mac OS X operating system, where as initialize.sh is applicable to all UNIX machines

Clone with Vundle submodule:
git clone --recursive https://github.com/tommyanthony/dotfiles.git

To set up Linux:
./initialize.sh

To set up Mac:
./initalize.sh
cd mac/
./mac.sh

TODO:
Doesn't automatically install pylint on Linux.
Doesn't automatically change color in ~/.oh-my-zsh/lib/theme-and-appearance.zsh
