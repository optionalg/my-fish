
function hands --description "Simple no-commit-message commit"
    git commit -m handsss
end

function gpush --description "Push master to origin"
    git push origin master
end

function gpull --description "Pull master from origin"
    git pull origin master
end
