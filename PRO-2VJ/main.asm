include all.asm

.model small
.stack
.data


    movRigth dw 4D00h
    movLeft dw 4B00h
    movUp dw 4800h
    movDow dw  5000h 

    TextControles db 'Controles actuales:'
    TextRigth db 'Derecha:'
    TextLeft db 'Izquierda:'
    TextUp db 'Arriba:'
    TextDow db  'Abajo:'

    
    TextIngreseRigth db 'movimiento Derecha:'
    TextIngreseLeft db 'movimiento Izquierda:'
    TextIngreseUp db 'movimiento Arriba:'
    TextIngreseDow db 'movimiento Abajo:'

    
    TextMovRigth db 20d dup(' ')
    TextMovLeft db 20d dup(' ')
    TextMovUp db 20d dup(' ')
    TextMovDow db 20d dup(' ')
    TextTest db 20d dup('$')

    testDefaulUp db 'Flecha arriba'
    testDefaulDow db 'Flecha abajo'
    testDefaulRigth db 'Flecha derecha'
    testDefaulLeft db 'Flecha izquierda'
    testDefaulOtro db 'Otro especial'

    TextCambiar db 'Cambiar controles'
    TextRegresar db 'Regresar'

    opcionConfig db 18d

  

    sprite_obj  db  47,47,47,47,47,47,47,47
                db  47,55,47,47,47,47,55,47
                db  47,47,55,47,47,55,47,47
                db  47,47,47,55,55,47,47,47
                db  47,47,47,55,55,47,47,47
                db  47,47,55,47,47,55,47,47
                db  47,55,47,47,47,47,55,47
                db  47,47,47,47,47,47,47,47
    
    sprite_caja db  47 ,47  ,47  ,47  ,47  ,47  ,47  ,47  
                db  47 ,47  ,5,5,5,5,47  ,47
                db  47 ,5,47  ,22 ,22 ,47  ,5,47
                db  47 ,5,22 ,47  ,47 ,22  ,5,47
                db  47 ,5,22 ,47  ,47 ,22  ,5,47
                db  47 ,5,47  ,22 ,22 ,47  ,5,47
                db  47 ,47  ,5,5,5,5,47  ,47
                db  47 ,47  ,47  ,47  ,47  ,47  ,47  ,47

    sprite_suelo    db  47,49,47,47,47,49,47,47
                    db  47,47,47,47,47,47,49,47
                    db  47,49,47,47,47,47,47,47
                    db  49,47,47,49,47,47,49,49
                    db  47,47,47,47,47,47,47,47
                    db  47,47,47,47,47,47,47,47
                    db  47,47,47,47,49,47,47,47
                    db  47,49,47,47,47,49,47,47

    sprite_pared    db   6, 6, 106, 6, 6, 106, 6, 6
                    db   6, 106, 6, 6, 106, 6, 6, 106
                    db   106, 6, 6, 106, 6, 6, 106, 6
                    db   6, 6, 6, 106, 6, 6, 106, 6
                    db   6, 6, 106, 6, 6, 106, 6, 6
                    db   6, 106, 6, 6, 106, 6, 6, 106
                    db   106, 6, 6, 106, 6, 6, 106, 6
                    db   6, 6, 6, 106, 6, 6, 106, 6
                    
    sprite_jug  db   47 ,47, 47, 47, 47, 47, 47, 47
                db   47 ,47, 47, 5, 5, 47, 47, 47
                db   47, 47, 5, 5, 5, 5, 47, 47
                db   47, 47, 5, 5, 5, 5, 47, 47
                db   47, 47, 47, 5, 5, 47, 47, 47
                db   47, 5, 5, 5, 5, 5, 5, 47
                db   47, 5, 5, 47, 47, 5, 5, 47
                db   47, 5, 5, 47, 47, 5, 5, 47

    sprite_nada  db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16
                db  16,16,16,16,16,16,16,16



    iniciarJuego db 'INICIAR JUEGO'
    cargarNivel db 'CARGAR NIVEL'
    configuracion db 'CONFIGURACION'
    puntajesAltos db 'PUNTAJES ALTOS'
    SalirJuego db 'SALIR'
    Flecha db '->'
    Espacio db ' '


    opcionMenu db 4d
   
    
    contador_indice dw 0
    coord_x dw 0
    coord_y dw 0
    color_video db 0

    video_x dw 0
    nombre db 'Susan Herrera'
    carnet db '201612218'

    fechaV db 'Fecha:'
    punteov db 'Punteo:'


    barra db '|'

    video_y dw 0
    indice_vid dw 0
    temporal_video dw 0
    contadormarco dw 0

    validationRanking db 0b

   
    contadorMovimientos dw 0
    MovimientoTexto db '$$$$'

    segundosInitJuego db 0d
    segundosJuego db 0d

    HorasTrascurridasJuego db 0d
    minutosTrascurridosJuego db 0d
    segundosTrascurridosJuego db 0d
     msgPause db ' Pausa'
    msgSalirPause db '1 = Salir de la partida'
    msgContinuarPause db '2 = Continuar partida '

    HorasTexto db "$$"
   

    validarGano db 0b
    msgGano db 'Ganaste!!!$'
    msgSaliendo db 'Saliendo$'
    nivel_actual db 1d
     minutosTexto db "$$"
    segundosTexto db "$$"
    DosTexto db ":"

    pintarx dw 0d
    pintary dw 0d

   
    j_y dw 0d
    tablero_nv db 920d dup('$') 
    tablero_nv_original db 920d dup('$') 
     pintarxPx dw 0d
    pintaryPx dw 0d

    j_x dw 0d
    j_xTemp dw 0d
    j_yTemp  dw 0d

   

    
    tablero_nv1 db 920d dup('$')
   
    j2_x dw 100d
    j2_y dw 0d
     j_xTemp_C dw 0d
    j_yTemp_C  dw 0d


    pieza_Temp db 's'
    pieza_TempSig db '$'

    tablero_nv3 db 920d dup('$') 
    tablero_nv3_original db 920d dup('$')
    j3_x dw 100d
     tablero_nv1_original db 920d dup('$')
    j1_x dw 100d
    j1_y dw 0d

    tablero_nv2 db 920d dup('$') 
    tablero_nv2_original db 920d dup('$')
    j3_y dw 0d

    estadoErr_nv1 db 0b
    estadoErr_nv2 db 0b
    
    msg_errJugaor_nv1 db 'No se encontro un jugador en el nivel 1$'
    msg_errJugaor_nv2 db 'No se encontro un jugador en el nivel 2$'
    msg_errJugaor_nv3 db 'No se encontro un jugador en el nivel 3$'
    
    estadoLeido_nv1 db 0b
    estadoLeido_nv2 db 0b
    estadoLeido_nv3 db 0b
    msg_errCajas_nv1 db 'Cajas no coinciden con objetivos en el nivel 1$'
    estadoErr_nv3 db 0b


    msg_errCajas_nv2 db 'Cajas no coinciden con objetivos en el nivel 2$'
    msg_errCajas_nv3 db 'Cajas no coinciden con objetivos en el nivel 3$'

    contadorCajas dw 0d
    contadorObjetivos dw 0d



    
    estado_nv dw 0d
    contadorTabulacion db 0d
    barrita db '-'
    msg_ganoF db "Felicidades, has ganado el juego con:"
  

    caracter_objeto db '$'
    crr_caracter db '$'
     tipo_objeto dw 0d
    objeto_x dw 0d
    objeto_y dw 0d
    posicion_tablero dw 0d
    text_temp db 10d dup('$')
    num_temp db '$$'
    num_temp1 db '$$'
      msg_ganoF2 db "Puntos!!!"
    msg_SganoF db "Preciona Enter para continuar" 
    msg_RganoF db "Has entrado al Ranking ingresa 3 iniciales"
    num_temp2 db '$$'

   

    comparar_cadenas db 0b

    text_objetivo db 'objetivo'
    text_caja db 'caja'
    
    hanlde_nv dw 0d 
    read_num dw 1d
    desplazamiento_lectura dw 0d

    validarEsMinuscula db 0b
    validarEsNumero db 0b
    text_suelo db 'suelo'
    text_pared db 'pared'
    text_jugador db 'jugador'


    ruta_nv1 db 'NIV.00',0
    ruta_nv2 db 'NIV.01',0
    ruta_nv3 db 'NIV.10',0
    msg_erro_nv1 db 'No se encontro el nivel 1'
   

    msg_err_tipo db 'Se detecto un objeto fuera de los parametros$'
    msg_err_x db 'Se ha intentado adignar una posicion X mayor a la del tablero$'
    msg_err_y db 'Se ha intentado adignar una posicion Y mayor a la del tablero$'
    msg_err_nivel db 'Se ha detectado error(es) en el archivo$'

    msg_salir_lectura db 'Termino Lectura$'


    handle_puntaje dw 0d
    ruta_puntaje db 'HIGHSC.BIN',0
     testderecha db 'derecha$'
    testizquierda db 'izquierda$'
    nombrePuntaje db 3d dup('$')
    numPuntaje dw 0
     msg_erro_nv2 db 'No se encontro el nivel 2'
    msg_erro_nv3 db 'No se encontro el nivel 3'
    msg_correcto db 'Se ha cargado el nivel correctamente'
    msg_error_nv db 'No se ha cargado los niveles correctamente'

    nombrePuntajeBusqueda db 3d dup('$')
    numPuntajeBusqueda dw 0d
    desPuntaje dw 0d
    



    testarriba db 'arriba$'
    testabajo db 'abajo$'
   
    
    test1 db 'aqui1$'
    test2 db 'aqui2$'
    test3 db 'aqui3$'
    test4 db 'aqui4$'
    test5 db 'aqui5$'
    test6 db 'aqui6$'
    test7 db 'aqui7$'
    test8 db 'aqui8$'
    test9 db 'aqui9$'
    test10 db 'aqui10$'
    test11 db 'aqui11$'
    test12 db 'aqui12$'
    test13 db 'aqui13$'
    test14 db 'aqui14$'
    test15 db 'aqui15$'
    test16 db 'aqui16$'
    test17 db 'aqui17$'
    test18 db 'aqui18$'
    test19 db 'aqui19$'
    test20 db 'aqui20$'
    test21 db 'aqui21$'
    test22 db 'aqui22$'
    testF db 'Termino$'
    testS db 'Inicio$'
.code


main proc
    mov dx, @DATA   
    mov ds , dx  
    xor dx,dx 
    call MainMenu  
    SalirTodoProgramaM
main endp

MainMenu proc
    call cambiartodoavideo  
    xor si,si

    Iniciar:
    LimpiarModoVideo
    ; pintarCuadricula
    ; para cambiar el coloro solo cambiar el ultimo numero 24 47
    pintartexto nombre,23,0,47
    pintartexto carnet,24,0,47

    pintartexto iniciarJuego,4,13,47    
    pintartexto cargarNivel,6,13,47
    pintartexto configuracion,8,13,47
    pintartexto puntajesAltos,10,13,47
    pintartexto SalirJuego,12,13,47

    
    MenuPrincipal:

    pintartexto Flecha,opcionMenu,11,47
    call HasKey
    jz MenuPrincipal

    xor ax,ax
    call GetKey

    cmp ax, 4800h
    je M1

    cmp ax, 5000h
    je M2

    cmp ax, 1C0Dh
    je MEnter

    M1:
    cmp opcionMenu,4d
    je MenuPrincipal
    pintartexto Espacio,opcionMenu,11,47
    sub opcionMenu,2d
    jmp MenuPrincipal

    M2:
    cmp opcionMenu,12d
    je MenuPrincipal
    pintartexto Espacio,opcionMenu,11,47
    add opcionMenu,2d
    jmp MenuPrincipal

    jmp MenuPrincipal

    MEnter:
    cmp opcionMenu,4d
    je IniciarJuegoMenu

    cmp opcionMenu,6d
    je CargarNivelesMenu

    cmp opcionMenu,8d
    je ConfiguracionMenu

    cmp opcionMenu,10d
    je PuntajesAltosMenu

    cmp opcionMenu,12d
    je SalirMenu

    IniciarJuegoMenu:
    ValidarNiveles
    call PlayGame
    jmp Iniciar

    CargarNivelesMenu:
    LeerNiveles
    jmp Iniciar

    ConfiguracionMenu:
    call ControlesView
    jmp Iniciar

    PuntajesAltosMenu:
    abrirNonExist ruta_puntaje,handle_puntaje
    LimpiarModoVideo
    recorrerPuntajesVideo
    cerrarF handle_puntaje
    getChar
    jmp Iniciar

    SalirMenu:
    FinalizarPrograma


    jmp Iniciar

    ret
MainMenu endp

ControlesView proc

    ControlMenu:
    call cambiartodoavideo
    LimpiarModoVideo

    mov opcionConfig,18d
    
    pintartexto TextControles,2,47,47
    ;este es para cambiar las configuracions
    clasificarPieza movRigth,TextMovRigth
    clasificarPieza movDow,TextMovDow
    clasificarPieza movUp,TextMovUp
    clasificarPieza movLeft,TextMovLeft

    pintartexto TextDow,6,2,47
    pintartexto TextMovDow,6,15,47


    pintartexto TextUp,8,2,47
    pintartexto TextMovUp,8,15,47


    pintartexto TextRigth,5,2,47
    pintartexto TextMovRigth,5,15,47


    pintartexto TextLeft,12,2,47
    pintartexto TextMovLeft,12,15,47


    pintartexto TextCambiar,18,47,47
    pintartexto TextRegresar,20,47,47

    
    ControlesMenuPrincipal:
    pintartexto Flecha,opcionConfig,2,47
    call HasKey
    jz ControlesMenuPrincipal

    xor ax,ax
    call GetKey

    cmp ax, 4800h
    je M1Controles

    cmp ax, 5000h
    je M2Controles

    cmp ax, 1C0Dh
    je MEnterControles

    M1Controles:
    cmp opcionConfig,18d
    je ControlesMenuPrincipal
    pintartexto Espacio,opcionConfig,2,47
    sub opcionConfig,2d
    jmp ControlesMenuPrincipal

    M2Controles:
    cmp opcionConfig,20d
    je ControlesMenuPrincipal
    pintartexto Espacio,opcionConfig,2,47
    add opcionConfig,2d
    jmp ControlesMenuPrincipal

    jmp ControlesMenuPrincipal

    MEnterControles:
    
        cmp opcionConfig,18d
        je IngresarTeclasConf

        cmp opcionConfig,20d
        je RegresarPrincipal


        IngresarTeclasConf:
        enterKeyConfig TextIngreseRigth,movRigth
        enterKeyConfig TextIngreseDow,movDow
        enterKeyConfig TextIngreseUp,movUp
    
    enterKeyConfig TextIngreseLeft,movLeft
        jmp ControlMenu

        RegresarPrincipal:
        jmp SalirControles

        
    jmp ControlesMenuPrincipal

    SalirControles:

    TerminaControlMenu:

    ret
ControlesView endp

PlayGame proc
   
    InitGame:
    mov nivel_actual,1d
    mov contadorMovimientos,0d
    Segundo segundosInitJuego 

    call cambiartodoavideo
    LimpiarModoVideo

    StartGame:

    cmp nivel_actual,1d
    je cargarNV1

    cmp nivel_actual,2d
    je cargarNV2

    cmp nivel_actual,3d
    je cargarNV3

    jmp GameAll

    cargarNV1:
    InsertarEnArray tablero_nv,tablero_nv1,0, SIZEOF tablero_nv
    InsertarEnArray tablero_nv_original,tablero_nv1_original,0, SIZEOF tablero_nv1_original
    mov ax,j1_x
    mov j_x,ax
    mov ax,j1_y
    mov j_y,ax
    jmp cargarNV

    cargarNV2:
    InsertarEnArray tablero_nv,tablero_nv2,0, SIZEOF tablero_nv
    InsertarEnArray tablero_nv_original,tablero_nv2_original,0, SIZEOF tablero_nv2_original
    mov ax,j2_x
    mov j_x,ax
    mov ax,j2_y
    mov j_y,ax
    jmp cargarNV

    cargarNV3:
    InsertarEnArray tablero_nv,tablero_nv3,0, SIZEOF tablero_nv
    InsertarEnArray tablero_nv_original,tablero_nv3_original,0, SIZEOF tablero_nv3_original
    mov ax,j3_x
    mov j_x,ax
    mov ax,j3_y
    mov j_y,ax
    jmp cargarNV

    cargarNV:
     

    StepGame:
       


    Segundo segundosJuego  
    CacularTranscurrido segundosInitJuego,segundosJuego,segundosTrascurridosJuego,minutosTrascurridosJuego ,HorasTrascurridasJuego
    
    ObtenerHoraTexto HorasTrascurridasJuego,minutosTrascurridosJuego,segundosTrascurridosJuego
    RemplazarChar SIZEOF HorasTexto, HorasTexto, '$', '0'
    RemplazarChar SIZEOF minutosTexto, minutosTexto, '$', '0'

    
    pintartexto nombre,23,0,47
    pintartexto carnet,24,0,47


    pintartexto fechaV,23,25,47
    pintartexto HorasTexto,23,31,47
    pintartexto minutosTexto,23,34,47
    pintartexto segundosTexto,23,37,47

    

    
    pintartexto punteov,24,25,47

    save16bits contadorMovimientos,MovimientoTexto
    pintartexto MovimientoTexto,24,35,47


    TestGano
    cmp validarGano,1b
    je NvWin

    

    
    printTableroVideo SIZEOF tablero_nv,tablero_nv

    call HasKey
    jz StepGame

    xor ax,ax
    call GetKey 

    cmp ax, movUp;flecha arriba
    je PasoArriba

    cmp ax, movDow;flecha abajo
    je PasoAbajo

    cmp ax, movRigth;flecha derecha
    je PasoDerecha

    cmp ax, movLeft;flecha izquierda
    je PasoIzquierda    

    cmp ax, 4400h;f10
    je MenuPausa   

    PasoArriba:
    moverArriba
    call VSync
    call VSync
    call VSync
    call delay2
    LimpiarModoVideo
    jmp CiclarJuego

    PasoAbajo:
    moverAbajo
    call VSync
    call VSync
    call VSync
    call delay2
    call delay2
    LimpiarModoVideo
    jmp CiclarJuego

    PasoDerecha:
    moverDerecha
    call VSync
    call VSync
    call VSync
    call delay2
    call delay2
    LimpiarModoVideo
    jmp CiclarJuego

    PasoIzquierda:
    moverIzquierda
    call VSync
    call VSync
    call VSync
    call delay2
    call delay2
    LimpiarModoVideo
    jmp CiclarJuego

    MenuPausa:
    LimpiarModoVideo
    pintartexto msgPause,10,47,47
    pintartexto msgSalirPause,11,47,47
    pintartexto msgContinuarPause,12,47,47
    getKeyPause:

    call HasKey
    jz getKeyPause

    xor ax,ax
    call GetKey 

    cmp ax, 1F73h;s
    je EndGame

    cmp ax, 2E63h;c
    je ContinuarPause

    ContinuarPause:
    jmp CiclarJuego

    CiclarJuego:
    jmp StepGame

    NvWin:
    printTableroVideo SIZEOF tablero_nv,tablero_nv
    inc nivel_actual
    jmp StartGame

  
    GameAll:

    mov ax,contadorMovimientos
    mov numPuntaje,ax

    LimpiarModoVideo
    ;texto cambiado
    pintartexto msg_ganoF,47,47,47

    save16bits numPuntaje,MovimientoTexto
    pintartexto MovimientoTexto,7,15,47
    pintartexto msg_ganoF2,8,13,47
    pintartexto msg_SganoF,10,4,47
    
    ISGameAll:
    call HasKey
    jz ISGameAll

    xor ax,ax
    call GetKey ;verificar teclas

    cmp ax, 1C0Dh;enter
    je SSGameAll

    jmp ISGameAll
    SSGameAll:
    
    LimpiarModoVideo
    
    LimpiarLimited SIZEOF nombrePuntaje,nombrePuntaje,' '

    abrirNonExist ruta_puntaje,handle_puntaje
    ValidarRanking
    cmp validationRanking,1b
    je EntroRanking
    jmp NoEntroRanking

    EntroRanking:
    pintartexto msg_RganoF,47,0,47

    getPass
    mov nombrePuntaje[0],al
    pintartexto nombrePuntaje,14,15,47

    getPass
    mov nombrePuntaje[1],al
    pintartexto nombrePuntaje,14,15,47

    getPass
    mov nombrePuntaje[2],al
    pintartexto nombrePuntaje,14,15,47

    EscribirPuntaje
    jmp ExitRankings

    NoEntroRanking:

    ExitRankings:
    cerrarF handle_puntaje
        
    EndGame:

    println msgSaliendo 
    ret
PlayGame endp

VSync proc
    mov dx, 03dah
    WaitNotVSync:
        in al, dx
        and al, 08h
        jnz WaitNotVSync
    WaitVSync:
        in al, dx
        and al, 08h
        jz WaitVSync
    ret
VSync endp

cambiartodoavideo proc
    iniciarmodovideo
    cambiaravideo
    entraramodovideo
    ret
cambiartodoavideo endp

GetKey proc
    xor ah, ah
    int 16h
    ret
GetKey endp

HasKey proc
    push ax
    mov ah, 00001h
    int 16h
    pop ax
    ret 
HasKey endp

delayJuego proc
        mov cx,1
    startDelay:
        cmp cx,10000
        je endDelay
        inc cx
        jmp startDelay
    endDelay:
        ret
delayJuego endp

delay proc
        mov cx,1
    startDelay:
        cmp cx,30000
        je endDelay
        inc cx
        jmp startDelay
    endDelay:
        ret
delay endp

delay2 proc
        push si
        xor si,si

    initdelay:
        mov cx,1
    startDelay2:
        cmp cx,90000h
        je endDelay2
        inc cx
        jmp startDelay2
    endDelay2:
        inc si
        cmp si,5
        jne initdelay
        pop si
        ret
delay2 endp

delay3 proc
        push si
        xor si,si

    initdelay:
        mov cx,1
    startDelay2:
        cmp cx,90000h
        je endDelay2
        inc cx
        jmp startDelay2
    endDelay2:
        inc si
        cmp si,10
        jne initdelay
        pop si
        ret
delay3 endp

delay4 proc
    push si
    xor si,si

    initdelay:
        mov cx,1
    startDelay2:
        cmp cx,90000h
        je endDelay2
        inc cx
        jmp startDelay2
    endDelay2:
        inc si
        cmp si,15
        jne initdelay
        pop si
        ret
delay4 endp

end main

