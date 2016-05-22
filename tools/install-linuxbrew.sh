if [ -n "$(command -v yum)" ]; then
    sudo yum groupinstall 'Development Tools' && sudo yum install curl irb m4 ruby;
else
    sudo apt-get install -y curl g++ gawk m4 make patch ruby tcl
fi;

unset LD_LIBRARY_PATH PKG_CONFIG_PATH HOMEBREW_CC;
EDITOR='nano';
export EDITOR;

PATH="$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin";
export PATH;


yes | ruby -e "$(curl -fsSL https://raw.github.com/Linuxbrew/linuxbrew/go/install)";
brew tap homebrew/dupes;
brew update;
brew install glibc;
brew install gcc --with-glibc;
brew install git;
brew install coreutils findutils gawk gnu-sed gnu-which grep make ruby;

