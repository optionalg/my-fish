
### https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish

###     set -g __fish_git_prompt_showstashstate         This is off.
###     set -g __fish_git_prompt_showstashstate 'yes'   This is on.
###     set -g __fish_git_prompt_showstashstate 'no'    This is, for some reason, on.
### Simply omitting (or commenting) the line results in it being off.
### 
### This used to be legal:
###     set -g __fish_git_prompt_color_branch magenta bold
### However, the _color_ settings are now supposed to be just one word, so:
###     set -g __fish_git_prompt_color_branch magenta
### Learn to live without the bold.
###

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_char_conflictedstate "✖"

### If "yes", the *_char_upstream_ characters are in effect.
### If "verbose", we get a readout like "u+1" ("we're one commit ahead of upstream")
set -g __fish_git_prompt_showupstream "yes"
#set -g __fish_git_prompt_showupstream "verbose"
### upstream_ahead
###     "We're ahead of upstream".  The branch has more commits.
### upstream_behind
###     "We're behind upstream".  The branch has fewer commits.
### upstream_diverged
###     Upstream and branch both have new commits.
set -g __fish_git_prompt_char_upstream_equal "✔"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_diverged "≠"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_color_upstream green

set -g __fish_git_prompt_showdirtystate "yes"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red

### I usually have something in the stash and I usually don't care, so leaving 
### this off.
set -g __fish_git_prompt_showstashstate
set -g __fish_git_prompt_char_stashstate "T"
set -g __fish_git_prompt_color_stashstate red

set -g __fish_git_prompt_showuntrackedfiles 'yes'
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal


function fish_right_prompt
    printf '%s' (__fish_git_prompt)
end

