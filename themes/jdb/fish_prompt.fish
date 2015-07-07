### Used by the git portion
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

function fish_prompt

    ### set_color:
    ###     http://fishshell.com/docs/current/commands.html#set_color
    ###     http://fishshell.com/docs/current/index.html#variables-color

    ### Debug, to make it easier to distinguish from bash when switching back 
    ### and forth.
    #set_color red --bold
    #printf '(FISH) '
    #set_color normal

    ### Python virtualenv
    if test $VIRTUAL_ENV
        printf "(%s) " (set_color $fish_color_quote)(basename $VIRTUAL_ENV)(set_color normal)
    end
    ### jon@samwise
    set_color $fish_color_match
    printf '%s' (whoami)
    printf '@'
    printf '%s' (hostname|cut -d . -f 1)
    set_color normal
    printf ' '

    ### CWD
    set_color yellow --bold
    printf '%s' (prompt_pwd)
    set_color normal

    ### Current git branch
    printf '%s' (__fish_git_prompt)

    ### Line 2 - the prompt
    echo
    #printf '↪ '    # nifty, but maybe a little too nifty.
    printf '$ '
    set_color normal
end
