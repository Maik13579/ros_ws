#full directory name of this script
export ROS_WS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#############
##   ROS   ##
#############

export ROS_DISTRO=noetic
export ROS_MASTER_URI=http://127.0.0.1:11311
export ROS_HOSTNAME=127.0.0.1
export ROS_IP=127.0.0.1

ros(){
    if [ -n "$1" ]; then
        docker run -it --rm --net=host -e ROS_MASTER_URI -e ROS_IP -e ROS_HOSTNAME ros:$1 bash
    else
        docker run -it --rm --net=host -e ROS_MASTER_URI -e ROS_IP -e ROS_HOSTNAME ros:noetic bash
    fi
}
roscore(){
    docker run -it --name roscore --rm --net=host -e ROS_MASTER_URI -e ROS_IP -e ROS_HOSTNAME ros:noetic-ros-core roscore
}

#############
##  Docker ##
#############

export COMPOSE_DOCKER_CLI_BUILD=1 
export DOCKER_BUILDKIT=1

#start services 
start(){
    if [ -n "$1" ]; then
	    docker-compose -f $ROS_WS_DIR/docker-compose.yml up "$@"
    else
    	echo "usage: start [option] [SERVICE...]"
	    echo "available services:"
        for SERVICE in $(docker-compose -f $ROS_WS_DIR/docker-compose.yml config --service);
	    do echo -e "\t* "$SERVICE;
	done;
	docker-compose up --help | sed -n '/Options/,/EOF/p'
    fi


}

