#!/bin/bash




case $1 in
    "proyecto") echo -e ".\n..\n...\ncreando el proyecto django $2" ; 
                django-admin.py startproject $2;;

	"init" )  echo -e "\n Iniciando el proyecto......"
              url=$(pwd)
              export PATH="$url:$PATH"
              echo "[$url] es la ruta del proyecto"
            ;;

	"com" ) echo "has agregado el siguente comentario $2";;

	"addconfig" ) echo "creaando los directorios y las configuraciones necesarias";;

	"" )  echo -e "\ndj.sh init | es para inicial un proyecto "
               echo "dj.sh  proyecto nombre_del_proyecto | es para crear un proyecto"
               echo "dj.sh com 'aqui va tu comentario'| esto es para agragar una notita al proyecto"
               echo "dj.sh  cerrar | es para cerrar del proyecto"

               ;;
	"cerrar" )  echo "Cerrando el proyecto" && exit ;;
esac




