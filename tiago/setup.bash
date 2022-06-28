#full directory name of this script
export TIAGO_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#start services 
start(){
    if [ -n "$1" ]; then
	    docker-compose -f $TIAGO_DIR/docker-compose.yml up "$@"
    else
    	echo "usage: start [option] [SERVICE...]"
	    echo "available services:"
        for SERVICE in $(docker-compose -f $TIAGO_DIR/docker-compose.yml config --service);
	    do echo -e "\t* "$SERVICE;
	done;
	docker-compose up --help | sed -n '/Options/,/EOF/p'
    fi


}

