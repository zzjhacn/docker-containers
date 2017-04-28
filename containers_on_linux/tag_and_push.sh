#docker images | grep -v REPOSITORY | awk '{print $1":"$2}' | awk -F "/" '{print "docker tag "$0" docker.raytest.com/"$NF" && docker push docker.raytest.com/"$NF}' | sh

#docker images | grep raytest | awk '{print "docker rmi "$1":"$2}'
