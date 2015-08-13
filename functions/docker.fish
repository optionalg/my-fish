
function rmstopped --description "Remove all stopped docker containers"
    docker rm (docker ps -a | grep Exited | awk '{print $1}')
end

function dockip --description "Get the IP of a running docker container"
    docker inspect --format '{{ .NetworkSettings.IPAddress }}' $argv[1]
end
