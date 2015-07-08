
### Provides 'mvf' (move and follow).
###
### mvf
###     mvf file newfile        -- Rename file, same as mv
###     mvf file dir            -- Move filename then cd to dir
###     mvf dir existdir        -- Move dir then cd to existdir/dir
###     mvf dir newdir          -- Rename dir to newdir then cd to newdir
###
### Moving is actually performed by mv.  
###
### Arguments passed to mvf will be passed along to mv, but that argument 
### passing is naive.  All arguments must be combined into a single arg spec.  
### "mvf -f -n dir newdir" won't work.

function mvf --description "Move file or dir and follow"

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

    ### Nope nope nope.
    ### Don't get clever and think "DRY says this command shouldn't exist in 
    ### both branches of the conditional below so I'll just move it up here!"
    ### We can't move the $thingy until we've determined whether it's a 
    ### directory or file or not.
    # mv $argv[1] $argv[2]

    if begin; test -f $thingy;  or test -L $thingy; end
        ### We're moving a file or a symlink.
        if test -n $args
            mv $args $thingy $target
        else
            mv $thingy $target
        end
        if test -d $target
            ### We're moving it to a directory, so cd to that directory.
            cd $target
        end
    else if test -d $thingy
        ### We're moving a directory, so cd to its new location.
        if test -n $args
            mv $args $thingy $target
        else
            mv $thingy $target
        end

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

