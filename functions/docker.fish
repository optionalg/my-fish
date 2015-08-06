
function rmstopped --description "Remove all stopped docker containers"
    docker rm (docker ps -a | grep Exited | awk '{print $1}')
end

