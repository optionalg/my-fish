
function fish_prompt

    ### set_color:
    ###     http://fishshell.com/docs/current/commands.html#set_color
    ###     http://fishshell.com/docs/current/index.html#variables-color

    ### Debug, to make it easier to distinguish from bash when switching back 
    ### and forth between shells in case they're both using otherwise-similar 
    ### prompts.
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
    ### This can live either here or in ./fish_right_prompt.fish, depending on 
    ### where you want it.  You can have it in both places if you want, but 
    ### you probably don't want.
    #printf '%s' (__fish_git_prompt)

    ### Line 2 - the actual prompt
    echo

    ### What are you in the mood for today?
    #printf '↪  '    # newline arrow
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
    #printf '☠ '    # skull - hard to see even on the terminal, but cool.
    #printf '✳ '    # sunburst
    #printf '$ '    # neckbeard

    set_color normal
end

