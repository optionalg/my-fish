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
#source ~/perl5/perlbrew/etc/perlbrew.fish
### 'source' is the bash command.  In fish it's simply '.'
. ~/perl5/perlbrew/etc/perlbrew.fish

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

### If PerlPowerTools has been installed (cpan), they should be in here.
set PATH $PATH /home/jon/perlpowertools/bin

### Rakudobrew
#set PATH $PATH /home/jon/.rakudobrew/bin
#/home/jon/.rakudobrew/bin/rakudobrew init > /dev/null 2>&1

### Regular Rakudo
set PATH $PATH /home/jon/.rakudo/bin
set PATH $PATH /home/jon/.rakudo/share/perl6/site/bin

### CLASSPATH
set CLASSPATH .
set CLASSPATH $CLASSPATH ~/work/java
set CLASSPATH $CLASSPATH ~/work/java/classpath/jsoup-1.8.2.jar
set CLASSPATH $CLASSPATH ~/work/java/classpath/gson-2.3.1.jar

### Leave this at the bottom of this file.  It gets added automatically by the 
### command "$ byobu-enable".
status --is-login; and status --is-interactive; and exec byobu-launcher
