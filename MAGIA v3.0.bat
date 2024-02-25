@echo off
title MAGIA (Porque no fue magia...)
:MAGIA-MENU
cls
echo                                                   #######                                           
echo                                                  *#,    ##*            ##  (##                      
echo                                                   ##     ##          ##     ##                      
echo                                                    ##     ##        ##     (#                       
echo                                                    ,##     ##      ##      #.                       
echo                                                     ##      ##    ##      ##                        
echo                                                      ##     *##  ##      ##                         
echo                                                       ##     ##.##      ##                          
echo                                                        ##              *#*                          
echo                                                 *########(#########    ##                           
echo                                                 ##    ####         ##  ##                           
echo                                             ######     .#######/     ####                           
echo                                            ##    ##.     ##   *#.     ###                           
echo                                             ##     ##     ##   ##      (#(                          
echo                                             ###     ###  .##            ##                          
echo                                             ## ##. ##                  ##                           
echo                                              ##                       ##                            
echo                                              *#.    NO FUE MAGIA    ##,                             
echo                                                ###      V2.0      /##                               
echo                                                  ##HECHO POR NMRD##                                
echo                                                  ##################      

echo.                                 [0m
echo                                  [31m**************************************************[0m
echo                                  [31m**[0m [46m                                            [0m [31m**[0m
echo                                  [31m**[0m [46m                                            [0m [31m**[0m
echo                                  [31m**[0m [7;43m                 MAGIA                      [0m [31m**[0m
echo                                  [31m**[0m [7;43m     El Script que lo inicio todo           [0m [31m**[0m
echo                                  [31m**[0m [46m                                            [0m [31m**[0m
echo                                  [31m**[0m [46m                                            [0m [31m**[0m
echo                                  [31m**************************************************[0m
echo                                  [31m**[0m [94m       Script creado por NMRD - 2023     [0m    [31m**[0m
echo                                  [31m**************************************************[0m
echo.                                 [31m**[0m                                              [31m**[0m
echo                                  [31m**[0m            [1;4mELIJA UNA OPCION[0m                  [31m**[0m
echo.                                 [31m**[0m                                              [31m**[0m
echo                                  [31m**[0m [91m  1) MAGIA PACK (Podes Elegir cuando cortar) [0m[31m**[0m
echo                                  [31m**[0m  [32m 2) MAGIA PACK (Sale con fritas)[0m            [31m**[0m
echo                                  [31m**[0m  [91m 3) MAGIA 1 x 1 (Util para cosas puntuales)[0m [31m**[0m
echo                                  [31m**[0m   4) [4mSalir[0m                                   [31m**[0m
echo                                  [31m**[0m                                              [31m**[0m
echo                                  [31m**************************************************[0m
echo.

SET /P M= [91mTU ELECCION ES:[0m [94m 
IF %M%==1 GOTO INICIO
IF %M%==2 GOTO FRITAS
IF %M%==3 GOTO INDIVIDUAL
IF %M%==4 GOTO FIN

:INICIO
cls
echo. 
echo                   o   ooooooooooo ooooooooooo oooo   oooo  oooooooo8 ooooo  ooooooo  oooo   oooo 
echo                  888  88  888  88  888    88   8888o  88 o888     88  888 o888   888o 8888o  88  
echo                 8  88     888      888ooo8     88 888o88 888          888 888     888 88 888o88  
echo                8oooo88    888      888    oo   88   8888 888o     oo  888 888o   o888 88   8888  
echo              o88o  o888o o888o    o888ooo8888 o88o    88  888oooo88  o888o  88ooo88  o88o    88  
echo.
echo.
echo Se recomienda encarecidamente que antes de realizar NINGUN CAMBIO, primero se asegure que el sistema este
echo completamente actualizado. Existen posibilidades que de no ser asi, las mejoras no funcionen, o sean revertidas
echo al aplicarse las nuevas actualizaciones.
echo.
echo Por ultimo, si bien ninguna de las optimizaciones que se realizaran aqui, deberian de causar problemas
echo se recuerda que la ejecucion de estos scripts prevee el conocimiento de lo que se esta realizando, y por consiguiente
echo corre bajo responsabilidad exclusiva de la persona que los ejecuta, quedando mi persona desligada de cualquier
echo responsabilidad ante cualquier problema que pudiera suceder debido a su ejecucion.
pause

:ENERGIA
cls
echo "         __  ____/___    |___   |/  /___  __ )____  _/___    |___  __ \    ___  __ \___  / ___    |___  | / /
echo "         _  /     __  /| |__  /|_/ / __  __  | __  /  __  /| |__  /_/ /    __  /_/ /__  /  __  /| |__   |/ / 
echo "         / /___   _  ___ |_  /  / /  _  /_/ / __/ /   _  ___ |_  _, _/     _  ____/ _  /____  ___ |_  /|  /  
echo "         \____/   /_/  |_|/_/  /_/   /_____/  /___/   /_/  |_|/_/ |_|      /_/      /_____//_/  |_|/_/ |_/   
echo "                ________ __________   _______________   ____________________ ________________________ 
echo "                ___  __ \___  ____/   ___  ____/___  | / /___  ____/___  __ \__  ____/____  _/___    |
echo "                __  / / /__  __/      __  __/   __   |/ / __  __/   __  /_/ /_  / __   __  /  __  /| |
echo "                _  /_/ / _  /___      _  /___   _  /|  /  _  /___   _  _, _/ / /_/ /  __/ /   _  ___ |
echo "                /_____/  /_____/      /_____/   /_/ |_/   /_____/   /_/ |_|  \____/   /___/   /_/  |_|
echo.                                                                                                       
echo.
echo Aca hay una lista de los planes de energia activos y cual es el que esta seleccionado actualmente.
powercfg /list
set "respuesta=y"
set /p "respuesta= Queres poner el plan de energia Maximo? [y|n]: "
if /i not "%respuesta%" == "y" goto :OTRAENERGIA
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
goto :MENUENERGIA

:OTRAENERGIA
powercfg /list
set "respuesta=y"
set /p "respuesta= Queres elegir otro plan de energia? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUENERGIA
echo Cuando Hayas identificado cual es el plan de energia que queres, copialo:
set "respuesta= "
set /p "respuesta=LUEGO PEGA ACA EL CODIGO y DALE ENTER: "
powercfg /setactive %respuesta%
if /i not "%respuesta%" == "n" goto :MENUENERGIA
:MENUENERGIA
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO SERVICES
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN


:SERVICES
cls
echo                      .d88b. 8888 888b. Yb    dP 888 .d88b 888 .d88b. .d88b. 
echo                      YPwww. 8www 8  .8  Yb  dP   8  8P     8  8P  Y8 YPwww. 
echo                          d8 8    8wwK'   YbdP    8  8b     8  8b  d8     d8 
echo                      `Y88P' 8888 8  Yb    YP    888 `Y88P 888 `Y88P' `Y88P' 
echo.
echo.
echo                         se desactivaran los siguientes servicios: 
echo           ************************************************************************
echo           ********** SysMain                                            ********** 
echo           ********** Windows Search                                     **********
echo           ********** Experiencias del usuario y telemetria asociadas    **********
echo           ********** Servicios de plataforma de dispositivos conectados **********
echo           ************************************************************************ 
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUSERVICIOS
sc config SysMain start=disabled
sc config WSearch start=disabled
sc config DiagTrack start=disabled
sc config CDPSvc start=disabled
echo.
echo Todos los servicios fueron correctamente deshabilitados
:MENUSERVICIOS
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO CORTANA
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN

:CORTANA
cls
echo                           ::::::::   ::::::::  ::::::::: ::::::::::: :::     ::::    :::     :::  
echo                         :+:    :+: :+:    :+: :+:    :+:    :+:   :+: :+:   :+:+:   :+:   :+: :+: 
echo                        +:+        +:+    +:+ +:+    +:+    +:+  +:+   +:+  :+:+:+  +:+  +:+   +:+ 
echo                       +#+        +#+    +:+ +#++:++#:     +#+ +#++:++#++: +#+ +:+ +#+ +#++:++#++: 
echo                      +#+        +#+    +#+ +#+    +#+    +#+ +#+     +#+ +#+  +#+#+# +#+     +#+  
echo                     #+#    #+# #+#    #+# #+#    #+#    #+# #+#     #+# #+#   #+#+# #+#     #+#   
echo                     ########   ########  ###    ###    ### ###     ### ###    #### ###     ###    
echo.
echo.

echo Ok, vamos a desconectar los servicios de WEBSEARCH y CORTANA. Procedemos?
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUCORTANA
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0
:MENUCORTANA
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO TEMPORIZADOREVENTOS
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN

:TEMPORIZADOREVENTOS 
cls
echo                                         **      ** *******  ******************
echo                                        /**     /**/**////**/**//////////**/// 
echo                                        /**     /**/**   /**/**         /**    
echo                                        /**********/******* /*******    /**    
echo                                        /**//////**/**////  /**////     /**    
echo                                        /**     /**/**      /**         /**    
echo                                        /**     /**/**      /********   /**    
echo                                        //      // //       ////////    //     
echo.
echo.
echo Esto desactivara definitivamente el Temporizador de eventos de alta precision y el Synthethic timer
echo ==== CUIDADO ====
echo Este proceso puede Mejorar el sistema, pero tambien puede introducir problemas. USAR SOLO si es necesario
echo Por este motivo se da la opcion de volver los cambios atras
set "respuesta=y"
set /p "respuesta= DESEA REALIZAR ESTOS CAMBIOS? [y|n]: "
if /i not "%respuesta%" == "y" goto :TEMPORIZADORNO
bcdedit /set useplatformclock No
bcdedit /set disabledynamictick Yes
echo Se abrira el menu del administrador de dispositivos. Por favor, vayan a la seccion
echo DISPOSITIVOS DEL SISTEMA
echo Alli busquen el item: Temporizador de Eventos de Alta Precision
echo DESHABILITEN ESTA OPCION
devmgmt.msc
goto :MENUTEMP

:TEMPORIZADORNO
set "respuesta=y"
set /p "respuesta= Desea VOLVER LOS VALORES A DEFAULT? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUTEMP
bcdedit /set useplatformclock Yes
bcdedit /set disabledynamictick No
echo Se abrira el menu del administrador de dispositivos. Por favor, vayan a la seccion
echo DISPOSITIVOS DEL SISTEMA
echo Alli busquen el item: Temporizador de Eventos de Alta Precision
echo HABILITEN ESTA OPCION
devmgmt.msc
:MENUTEMP
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO DEFRAGMENTADOR
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN


:DEFRAGMENTADOR
cls
                                                                                                  
echo "                     .--. .---..---..--.     .    .--..    ..---..   ..---.  .    .--.  .--. .--. 
echo "                    |   :|    |    |   )   / \  :    |\  /||    |\  |  |   / \   |   ::    :|   )
echo "                    |   ||--- |--- |--'   /___\ | --.| \/ ||--- | \ |  |  /___\  |   ||    ||--' 
echo "                    |   ;|    |    |  \  /     \:   ||    ||    |  \|  | /     \ |   ;:    ;|  \ 
echo "                    '--' '---''    '   `'       ``--''    ''---''   '  ''       `'--'  `--' '   `
echo.
echo.                                                                                                  
echo Esto desactivara el defragmentador automatico de Windows
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUDEFRAG
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
rem schtasks /Delete /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /F
:MENUDEFRAG
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO ANIMACIONES
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN


:ANIMACIONES
cls
echo             .d8b.  d8b   db d888888b .88b  d88.  .d8b.   .o88b. d888888b  .d88b.  d8b   db d88888b .d8888. 
echo            d8' `8b 888o  88   `88'   88'YbdP`88 d8' `8b d8P  Y8   `88'   .8P  Y8. 888o  88 88'     88'  YP 
echo            88ooo88 88V8o 88    88    88  88  88 88ooo88 8P         88    88    88 88V8o 88 88ooooo `8bo.   
echo            88~~~88 88 V8o88    88    88  88  88 88~~~88 8b         88    88    88 88 V8o88 88~~~~~   `Y8b. 
echo            88   88 88  V888   .88.   88  88  88 88   88 Y8b  d8   .88.   `8b  d8' 88  V888 88.     db   8D 
echo            YP   YP VP   V8P Y888888P YP  YP  YP YP   YP  `Y88P' Y888888P  `Y88P'  VP   V8P Y88888P `8888Y' 
echo.
echo.
echo Esto desactivara las animaciones del sistema.
set "respuesta=y"
set /p "respuesta= Desea continuar? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENUANIM
rem sc stop uxsms
rem reg.exe add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting /t REG_DWORD /d 00000002"
echo Se abrira el menu de opciones de rendimiento. Bajo la pestaña de efectos visuales, deberas marcar la opcion:
echo AJUSTAR PARA OBTENER EL MEJOR RENDIMIENTO
echo luego volver a marcar las opciones
echo GUARDAR VISTAS PREVIAS DE MINIATURAS...
echo MOSTRAR VISTAS EN MINIATURAS...
echo SUAVIZAR BORDES PARA LAS FUENTES...
echo Aplicar y aceptar
pause
%windir%\system32\SystemPropertiesPerformance.exe
pause
:MENUANIM
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO PAGINACION
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN


:PAGINACION
cls
echo              @@@@@@@    @@@@@@    @@@@@@@@  @@@  @@@  @@@   @@@@@@    @@@@@@@  @@@   @@@@@@   @@@  @@@  
echo              @@@@@@@@  @@@@@@@@  @@@@@@@@@  @@@  @@@@ @@@  @@@@@@@@  @@@@@@@@  @@@  @@@@@@@@  @@@@ @@@  
echo              @@!  @@@  @@!  @@@  !@@        @@!  @@!@!@@@  @@!  @@@  !@@       @@!  @@!  @@@  @@!@!@@@  
echo              !@!  @!@  !@!  @!@  !@!        !@!  !@!!@!@!  !@!  @!@  !@!       !@!  !@!  @!@  !@!!@!@!  
echo              @!@@!@!   @!@!@!@!  !@! @!@!@  !!@  @!@ !!@!  @!@!@!@!  !@!       !!@  @!@  !@!  @!@ !!@!  
echo              !!@!!!    !!!@!!!!  !!! !!@!!  !!!  !@!  !!!  !!!@!!!!  !!!       !!!  !@!  !!!  !@!  !!!  
echo              !!:       !!:  !!!  :!!   !!:  !!:  !!:  !!!  !!:  !!!  :!!       !!:  !!:  !!!  !!:  !!!  
echo              :!:       :!:  !:!  :!:   !::  :!:  :!:  !:!  :!:  !:!  :!:       :!:  :!:  !:!  :!:  !:!  
echo               ::       ::   :::   ::: ::::   ::   ::   ::  ::   :::   ::: :::   ::  ::::: ::   ::   ::  
echo               :         :   : :   :: :: :   :    ::    :    :   : :   :: :: :  :     : :  :   ::    :   
echo.
echo.                                                                                                         
echo Modificaremos el tamaño de la paginacion.
echo.
echo.
echo Lo primero que debemos hacer es saber cual es la memoria total REAL de la PC.

for /F "delims=" %%a in ('systeminfo ^| findstr /C:"Cantidad total de memoria"') do set "memoria=%%a"
echo Esta es la %memoria% en esta PC

echo.
set "respuesta=y"
set /p "respuesta= La PC, tiene 4gb de ram? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACION8GB

:PAGINACION4GB
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=1373,MaximumSize=6144
goto :MENUPAGINACION

:PAGINACION8GB
set "respuesta=y"
set /p "respuesta= La PC, tiene 8gb de ram? [y|n]: "
if /i not "%respuesta%" == "y" goto :PAGINACIONESPECIAL
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2746,MaximumSize=12288
goto :MENUPAGINACION

:PAGINACIONESPECIAL
cls
echo Ok, la complicaste...Lo mejor que podes hacer es lo siguiente:
echo Ahora se va a abrir el menu de OPCIONES DE RENDIMIENTO, alli deberas ir a la pestaña
echo OPCIONES AVANZADAS
echo luego dentro del SUBMENU MEMORIA VIRTUAL ingresa en CAMBIAR 
echo Aqui, deberas DESTILDAR la opcion "Administrar automaticamente..."
echo Marcar la opcion tamaño personalizado
echo en tamaño inicial, coloca el numero que dice abajo donde dice RECOMENDADO
echo y en tamaño maximo tenes que calcular tu memoria ram 1.5 veces
echo esto se hace haciendo lo siguiente:
echo 1GB = 1024MB
echo por lo tanto si tu pc tiene 16gb RAM = 16x1024 = 16388 y a este numero hay que multiplicarlo por 1.5
echo dando un total de 24576 (el cual colocaras donde dice EL MAXIMO)
echo luego deberar poner ESTABLECER y aceptar todo.
echo Eventualmente deberas reiniciar, pero podes seguir con el script mientras tanto...
%windir%\system32\SystemPropertiesPerformance.exe
pause
:MENUPAGINACION
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO 2DOPLANO
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN

:2DOPLANO
cls
echo                    ****  *******     *******     *******  **           **     ****     **   *******  
echo                   */// */**////**   **/////**   /**////**/**          ****   /**/**   /**  **/////** 
echo                  /    /*/**    /** **     //**  /**   /**/**         **//**  /**//**  /** **     //**
echo                     *** /**    /**/**      /**  /******* /**        **  //** /** //** /**/**      /**
echo                    *//  /**    /**/**      /**  /**////  /**       **********/**  //**/**/**      /**
echo                   *     /**    ** //**     **   /**      /**      /**//////**/**   //****//**     ** 
echo                  /******/*******   //*******    /**      /********/**     /**/**    //*** //*******  
echo                  ////// ///////     ///////     //       //////// //      // //      ///   ///////   
echo.
echo.
echo Ahora procederemos a realizar la desactivacion de las aplicaciones en segundo plano.
set "respuesta=y"
set /p "respuesta=Continuamos? [y|n]: "
if /i not "%respuesta%" == "y" goto :MENU2DOPLANO
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f
:MENU2DOPLANO
echo.
echo.
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para CONTINUAR, 2 para VOLVER AL MENU DE MAGIA o 3 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO SERVICIOSINICIO
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO FIN

:SERVICIOSINICIO
cls
                                                                                                          
echo              IIIIIIIIIINNNNNNNN        NNNNNNNNIIIIIIIIII      CCCCCCCCCCCCCIIIIIIIIII     OOOOOOOOO     
echo              I::::::::IN:::::::N       N::::::NI::::::::I   CCC::::::::::::CI::::::::I   OO:::::::::OO   
echo              I::::::::IN::::::::N      N::::::NI::::::::I CC:::::::::::::::CI::::::::I OO:::::::::::::OO 
echo              II::::::IIN:::::::::N     N::::::NII::::::IIC:::::CCCCCCCC::::CII::::::IIO:::::::OOO:::::::O
echo                I::::I  N::::::::::N    N::::::N  I::::I C:::::C       CCCCCC  I::::I  O::::::O   O::::::O
echo                I::::I  N:::::::::::N   N::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N:::::::N::::N  N::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N::::::N N::::N N::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N::::::N  N::::N:::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N::::::N   N:::::::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N::::::N    N::::::::::N  I::::IC:::::C                I::::I  O:::::O     O:::::O
echo                I::::I  N::::::N     N:::::::::N  I::::I C:::::C       CCCCCC  I::::I  O::::::O   O::::::O
echo              II::::::IIN::::::N      N::::::::NII::::::IIC:::::CCCCCCCC::::CII::::::IIO:::::::OOO:::::::O
echo              I::::::::IN::::::N       N:::::::NI::::::::I CC:::::::::::::::CI::::::::I OO:::::::::::::OO 
echo              I::::::::IN::::::N        N::::::NI::::::::I   CCC::::::::::::CI::::::::I   OO:::::::::OO   
echo              IIIIIIIIIINNNNNNNN         NNNNNNNIIIIIIIIII      CCCCCCCCCCCCCIIIIIIIIII     OOOOOOOOO     
echo.                                                                                                          
echo.
echo.
echo Ahora desactivaremos los servicios que se cargan al iniciar la PC
echo Se abrira el menu de CONFIGURACION DEL SISTEMA
echo deben ir a la pestaña de SERVICIOS
echo ABAJO marquen la opcion OCULTAR TODOS LOS SERVICIOS DE MICROSOFT
echo Luego...DESHABILITEN TODO.
pause
echo una vez hayan hecho esto, deben ir a la Pestaña INICIO DE WINDOWS
echo alli deberan clickear en "abrir el administrador de tareas" 
echo En ese lugar, deben deshabilitar aquellas cosas que consideren que no son importantes
echo para el inicio de la PC. 
echo Por ultimo, APLIQUEN y ACEPTEN.
pause
msconfig
:OWO
cls
echo.
echo.
echo -----------------------ACA PONER GRAFICO LINDO--------------------------------------------------------
echo ------------------------------------------------------------------------------------------------------
SET /P M=1 para HABILITAR OWO, 2 para DESHABILITAR OWO, 3 para volver al MENU DE MAGIA o 4 para SALIR DEL PROGAMA. Luego apreta ENTER!: 
IF %M%==1 GOTO HABILITAROWO
IF %M%==2 GOTO DESHABILITAROWO
IF %M%==3 GOTO MAGIA-MENU
IF %M%==4 GOTO SALIR

:HABILITAROWO
sc config UsoSvc start= auto
sc config wuauserv start= auto
sc start UsoSvc
sc start wuauserv
pause
goto MAGIA-MENU

:DESHABILITAROWO
sc stop UsoSvc
sc stop wuauserv
sc config UsoSvc start= disabled
sc config wuauserv start= disabled
pause
goto MAGIA-MENU
cls
echo.
echo.
echo "                                                _______  __  .__   __. 
echo "                                               |   ____||  | |  \ |  | 
echo "                                               |  |__   |  | |   \|  | 
echo "                                               |   __|  |  | |  . `  | 
echo "                                               |  |     |  | |  |\   | 
echo "                                               |__|     |__| |__| \__| 
                                                                        

pause
goto :MAGIA-MENU

:INDIVIDUAL
cls
echo             88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
echo             888888888888888888888888888888888888 NOMBRE DE LA OPCION   888888888888888888888888888888888888888888
echo             88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
echo             8888    1- EDITAR EL PLAN DE ENERGIA                                                             8888
echo             8888    2- DESHABILITAR SERVICIOS NO ESCENCIALES                                                 8888
echo             8888    3- DESACTIVAR CORTANA Y WEBSEARCH                                                        8888
echo             8888    4- DESHABILITAR HPET                                                                     8888
echo             8888    5- DESACTIVAR EL DEFRAGMENTADOR DE DISCOS (Scheduled Task)                               8888
echo             8888    6- DESACTIVAR LAS ANIMACIONES                                                            8888
echo             8888    7- MODIFICAR EL TAMAÑO DE LA PAGINACION                                                 8888
echo             8888    8- DESACTIVAR LAS APLICACIONES EN SEGUNDO PLANO                                          8888
echo             8888    9- DESACTIVAR LOS SERVICIOS DE INICIO                                                    8888
echo             8888    10- DESACTIVAR / ACTIVAR ORQUESTADOR Y UPDATES                                           8888
echo             8888    11- VOLVER A MAGIA                                                                       8888
echo             88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
echo             88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
echo.
echo.

SET /P M=Selecciona 1, 2, 3, 4, 5, 6, 7, 8, 9 o 10 y apreta ENTER: 
IF %M%==1 GOTO ENERGIA
IF %M%==2 GOTO SERVICES
IF %M%==3 GOTO CORTANA
IF %M%==4 GOTO TEMPORIZADOREVENTOS
IF %M%==5 GOTO DEFRAGMENTADOR
IF %M%==6 GOTO ANIMACIONES
IF %M%==7 GOTO PAGINACION
IF %M%==8 GOTO 2DOPLANO
IF %M%==9 GOTO SERVICIOSINICIO
IF %M%==10 GOTO OWO
IF %M%==11 GOTO MAGIA-MENU


:FRITAS
cls
echo Hola, estas a punto de probablmente cagarla bastante fulero.
echo Realmente te recomiendo que uses las otras opciones, entiendo que clickear 20 veces 1 para CONTINUAR es aburrido..
echo pero si no sabes lo que haces....es posible que la cagues...
echo Pero... si estas seguro que queres hacer eso, quien soy yo para impedirlo....

SET /P M=Selecciona 1 para CAGARLA, 2 para volver al MENU DE MAGIA, 3 para SALIR y apreta ENTER: 
IF %M%==1 GOTO CAGARLA
IF %M%==2 GOTO MAGIA-MENU
IF %M%==3 GOTO SALIR

:CAGARLA

powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
sc config SysMain start=disabled
sc config WSearch start=disabled
sc config DiagTrack start=disabled
sc config CDPSvc start=disabled
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0
bcdedit /set useplatformclock No
bcdedit /set disabledynamictick Yes
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
rem schtasks /Delete /TN "\Microsoft\Windows\Defrag\ScheduledDefrag" /F
rem sc stop uxsms
rem reg.exe add "HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting /t REG_DWORD /d 00000002"
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=false
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=1373,MaximumSize=6144
Reg Add HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications /v GlobalUserDisabled /t REG_DWORD /d 1 /f
sc stop UsoSvc
sc stop wuauserv
sc config UsoSvc start= disabled
sc config wuauserv start= disabled
devmgmt.msc
%windir%\system32\SystemPropertiesPerformance.exe
msconfig
echo LISSTO...
echo  Na lu e-govaned 
pause
GOTO MAGIA-MENU







