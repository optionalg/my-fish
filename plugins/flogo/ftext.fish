
function ftext --description "Display fish shell text logo"
    set -l cn (set_color normal)

    ### Regular-weight colors
    set -l cr (set_color red)
    set -l cy (set_color yellow)
    set -l cg (set_color green)
    set -l cb (set_color blue)
    set -l cp (set_color purple)

    ### Bold-weight colors
    set -l cbr (set_color -o red)
    set -l cby (set_color -o yellow)
    set -l cbg (set_color -o green)
    set -l cbb (set_color -o blue)
    set -l cbp (set_color -o purple)

    ### Originally generated with figlet, but I didn't want to introduce 
    ### figlet as a prereq, so I just copied its output.
    printf "%s _____ _     _       ____  _          _ _ \n" $cr
    printf "%s|  ___(_)___| |__   / ___|| |__   ___| | |\n" $cy
    printf "%s| |_  | / __| '_ \  \___ \| '_ \ / _ \ | |\n" $cg
    printf "%s|  _| | \__ \ | | |  ___) | | | |  __/ | |\n" $cb
    printf "%s|_|   |_|___/_| |_| |____/|_| |_|\___|_|_|%s\n" $cp $cn

    ### Yeah, I know that's pretty hideous.  It's worse with the bold colors 
    ### instead of the normal-weight ones.
    ###
    ### Good thing I'm a programmer and not a designer.
end

