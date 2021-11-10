#for image in ubuntu:18.04 ubuntu:20.04 ubuntu:16.04 nginx
for image in nginx:latest traefik:2.4 mariadb:10.4
#for image in 'anoxis/registry-cli:latest'
#for image in 'busybox:latest'
do
base=$(echo $image|cut -d":" -f1)
tag=$(echo $image|cut -d":" -f2)
	echo "$image $base $tag"
docker pull "$base:$tag"
docker tag "$base:$tag" "private.repo.goes.here/$base:$tag"
docker push "private.repo.goes.here/$base:$tag"
docker image remove "$base:$tag"
docker image remove "private.repo.goes.here/$base:$tag"


done
