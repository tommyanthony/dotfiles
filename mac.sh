# Check for Homebrew,
# Install if we don't have it
# Assumes that Ruby is preinstalled on the machine
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

commandFromFile () {
    filename="$1"
    prefix="$2 install"
    while read -r line
    do
        command="$prefix $line"
        echo $command
        eval $command
    done < "$filename"
}

commandFromFile "brew.txt" "brew"

# Requirements for brew cast to work
brew tap caskroom/cask
brew install caskroom/cask/brew-cask
commandFromFile "brew-cask.txt" "brew cask"

# Set faster keyboard repetition
defaults write NSGlobalDomain KeyRepeat -int 2

# Set faster mouse and trackpad movement
defaults write -g com.apple.trackpad.scaling -int 1.5
defaults write -g com.apple.mouse.scaling -int 1.5

# Privacy modifications
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Install pylint
pip install pylint
