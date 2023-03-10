#!/bin/bash
if [ $# -lt 1 ]; then
echo Quantidade de cores do processador a serem utilizados:
read core
if [ ! ${core} ]; then
	echo Quantidade de cores não definida. Serão utilizados 8 por padrão.
	core=8
	sleep 1
fi
else
core="${1}"
fi
docker run --rm -it -d -e QTDCORE=${core} --volume="$PWD"/bahiart:/home/bahiart:rw --volume="$PWD"/libsetplay:/home/libsetplay:rw --name build builder
docker logs --follow build
