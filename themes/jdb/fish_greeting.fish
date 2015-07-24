function fish_greeting --description 'Print the shell greeting'
    set -l cn (set_color normal)
    set -l cc (set_color cyan)

    set -l location (printf "%sWelcome to %s%s%s" $cn $cc (hostname) $cn)
    set -l system (printf "%sRunning %s%s%s on %s%s%s" $cn $cc (uname -mrs) $cn $cc (tty | sed -e 's/.*tty\(.*\)/\1/') $cn)
    set -l lsb (printf "%sDist version %s%s%s, codename %s%s%s" $cn $cc (lsb_release -ds) $cn $cc (lsb_release -cs) $cn)
    set -l datetime (printf "%sIt is %s%s%s (%s) on %s%s%s" $cn $cc (date +%T) $cn (date +%Z) $cc (date +%F) $cn)
    set -l perlbrew (printf "%sCurrent perlbrew version in use is %s%s%s." $cn $cc $PERLBREW_PERL $cn)

    printf "%s" $cc
    ftext
    printf "%s" $cn
    flogo
    printf "\n %s\n %s\n %s\n %s\n %s\n\n" $location $system $lsb $perlbrew $datetime
end
