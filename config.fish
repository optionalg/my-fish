### Friendly Interactive Shell startup file.
### Ported over from ~/.bashrc 06/05/2015

### General command aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias rm=trash

### Perlbrew
### You need a pretty recent perlbrew for this.  0.67 of App::perlbrew wasn't 
### new enough, but 0.73 was.
source ~/perl5/perlbrew/etc/perlbrew.fish

#############################################
### Oh-my-fish (plugin manager framework) ###
#############################################
# Path to your oh-my-fish installation.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
set fish_custom $HOME/.config/fish/my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Load theme and plugins
Theme 'jdb'
Plugin 'cpf'
Plugin 'dss-vi-mode'
Plugin 'emoji-clock'
Plugin 'flogo'
Plugin 'jump'
Plugin 'msg'
Plugin 'mvf'

###############################
### Load External Functions ###
###############################
### Set up virtualenv switchers
. ~/.config/fish/my-fish/functions/virtualenvs.fish
### And chose which one to default to
virtmonty

### git shortcuts
. ~/.config/fish/my-fish/functions/gitabbrvs.fish

### docker shortcuts
. ~/.config/fish/my-fish/functions/docker.fish

####################
### PATH Changes ###
####################
### Jython
set PATH $PATH /home/jon/Applications/jython2.7.0/bin
set JYTHON_HOME /home/jon/Applications/jython2.7.0

### Lolcode (lci)
set PATH $PATH /home/jon/opt/bin

### PyCharm Python IDE
set PATH $PATH /home/jon/Applications/pycharm-community-4.0.4/bin

### Rust
set PATH $PATH /home/jon/Applications/rust/bin
set LD_LIBRARY_PATH $LD_LIBRARY_PATH /home/jon/Applications/rust/lib

### CLASSPATH
set CLASSPATH .
set CLASSPATH $CLASSPATH ~/work/java
set CLASSPATH $CLASSPATH ~/work/java/classpath/jsoup-1.8.2.jar
set CLASSPATH $CLASSPATH ~/work/java/classpath/gson-2.3.1.jar

### Leave this at the bottom of this file.  It gets added automatically by the 
### command "$ byobu-enable".
status --is-login; and status --is-interactive; and exec byobu-launcher
