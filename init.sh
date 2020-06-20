if [ "$1" == "clean" ] ; then
	docker image prune -f
fi
docker build -t ft_server .
docker container stop ft_server_live
docker container rm ft_server_live
docker run -it -d --name ft_server_live ft_server
docker exec -it ft_server_live bash
