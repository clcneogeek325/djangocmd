#!/bin/bash




case $1 in
    "proyecto") echo -e ".\n..\n...\ncreando el proyecto django $2" ; 
                django-admin.py startproject $2
                echo "$2" > $2/.nombre.txt;;

	"init" )  echo -e "\n Iniciando el proyecto......"
              url=$(pwd)
              export PATH="$url:$PATH"
              echo "[$url] es la ruta del proyecto"
            ;;

	"com" ) echo "has agregado el siguente comentario $2";;

	"addconfig" )       if [ -f .nombre.txt ]
                        then
                                echo "creando los directorios y las configuraciones necesarias"
                                nombre=$(cat .nombre.txt)
                                if [ -d plantillas ]
                                then
                                        echo "el directorio plantillas ya existe"
                                else    
                                        mkdir plantillas && echo "creando el directorio plantillas"
                                fi
                                if [ -d apps ]
                                then
                                        echo "ya existe el directoio apps"
                                else
                                        mkdir apps && echo "creando el directorio apps"
                                fi
                                if [ -d media ]
                                then
                                        echo "el directorio media ya existe"
                                else
                                        mkdir media && echo "creando el directorio media"
                                fi
                                static=$(cat $nombre/settings.py | grep STATICFILES_DIRS)
                                plantillas=$(cat $nombre/settings.py | grep TEMPLATE_DIRS)
                                if [ "$static" = "" ]
                                then
                                        echo -e " \nSTATICFILES_DIRS = (\n'static/',\n)" >> $nombre/settings.py
                                else
                                        echo "El proyecto ya contiene la variable de los archivos estaticos"
                                fi
                                if [ "$plantillas" = "" ]
                                then
                                        echo -e " \nTEMPLATE_DIRS = (\n'plantillas/',\n)" >> $nombre/settings.py
                                else
                                        echo "El proyecto ya contiene la variable de plantillas"
                                fi

                        else
                                echo "no existe un archivo de configuracion llamdo .nombre.txt"
                        fi
            ;;

	"" )  echo -e "\ndj.sh init | es para inicial un proyecto "
               echo "dj.sh  proyecto nombre_del_proyecto | es para crear un proyecto"
               echo "dj.sh com 'aqui va tu comentario'| esto es para agragar una notita al proyecto"
               echo "dj.sh  cerrar | es para cerrar del proyecto"

               ;;
	"cerrar" )  echo "Cerrando el proyecto" && exit ;;
esac




