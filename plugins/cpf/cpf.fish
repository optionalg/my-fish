
### Provides 'cpf' (copy and follow).
###
### cpf
###     cpf file newfile        -- Rename file to newfile, same as cp
###     cpf file dir            -- Copy file in to dir, cd to dir
###     cpf -Rip dir existdir   -- Copy dir in to existdir, cd to existdir/dir
###     cpf -Rip dir newdir     -- Rename dir to newdir, cd to newdir
###
### Copying is actually performed by cp.
###
### Arguments passed to cpf will be passed along to cp, but that argument 
### passing is naive.  All arguments must be combined into a single arg spec, 
### as above.  "cpf -R -i -p dir newdir" won't work.

function cpf --description "Copy file and follow"

    set -l args     ""
    set -l thingy   ""
    set -l target   ""

    if set -q argv[3]
        set args    $argv[1]
        set thingy  $argv[2]
        set target  $argv[3]
    else
        set args    ""
        set thingy  $argv[1]
        set target  $argv[2]
    end

    if test -n $args
        cp $args $thingy $target
    else
        cp $thingy $target
    end

    if begin; test -f $thingy;  or test -L $thingy; end
        ### We're copying a file or a symlink.
        if test -d $target
            ### We're copying it to a directory, so cd to that directory.
            cd $target
        end
    else if test -d $thingy
        ### We're copying a directory, so cd to its new location.
        set newdir (printf "%s/%s/%s" (dirname $target) (basename $target) $thingy)
        if test -d $newdir
        else
            ### "$target/$thingy" is not a directory, which means we just 
            ### renamed $thingy to $target rather than moving the one into the 
            ### other.
            set newdir (printf "%s" $target)
        end
        cd $newdir
    end
end

