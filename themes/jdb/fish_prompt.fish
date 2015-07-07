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
    ### prompt_pwd abbreviates all dirs in the path to a single letter, except 
    ### for the final dir.  OK, I get it, but I'm using a multi-line prompt 
    ### here and just don't need all that abbreviation, which does make the 
    ### pwd info hard to read.  So just use a regular pwd.
    #printf '%s' (prompt_pwd)
    printf '%s' (pwd)
    set_color normal

    ### Current git branch
    printf '%s' (__fish_git_prompt)

    ### Line 2 - the actual prompt
    echo
    ### What are you in the mood for today?
    #printf '↪ '    # newline arrow
    #printf '≻ '    # curvy arrow
    #printf '► '    # narrow block arrow
    #printf '▶ '    # thick block arrow
    #printf '➤ '    # fancy block arrow
    #printf '⇝ '    # squiggly line arrow
    #printf '➟ '    # broken (motion) line arrow
    printf '➫ '    # shadow arrow
    #printf '➻ '    # bulbous arrow
    #printf '➺ '    # fancy bulbous arrow
    #printf '⇛ '    # double line arrow
    #printf '≫  '   # 2 GTs
    #printf '⋙  '   # 3 GTs
    #printf '✈ '    # airplane
    #printf '◈ '    # outlined diamond
    #printf '☠ '    # skull - hard to see even on the terminal, but cool anyway.
    #printf '✳ '    # sunburst
    #printf '$ '    # neckbeard
    set_color normal
end
