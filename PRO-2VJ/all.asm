


dibujarcuadroSprite MACRO x, y, ancho, alto, colores
    LOCAL v1, v2,v3,v4
    mov contador_indice,0


    xor si,si
    v1:
    cmp si,ancho
    je v4

    mov ax,x
    add ax,si
    mov  coord_x,ax

    xor di,di
    v2:
        cmp di,alto
        je v3

        mov ax, y
        add ax,di
        mov coord_y,ax

        push ax
        push si
        mov si,contador_indice
        pintarpixelpro coord_x,coord_y,colores[si]
        pop si
        pop ax

        inc di
        inc contador_indice
        jmp v2
    v3:
    inc si
    jmp v1

    v4:

ENDM

setModoTexto macro
    mov ax, 0003h
    int 10h
endm

getPass macro 
    mov ah,07h
    int 21h
endm

BucarVacioPuntaje macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
    xor si,si
    mov desPuntaje,0d

    mInicio:
    push si
    LimpiarLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,'$'
    pop si

    mov di,si
    leerFDesplazado SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF nombrePuntajeBusqueda
    leerFDesplazado SIZEOF numPuntajeBusqueda,numPuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF numPuntajeBusqueda

    
    mov al, nombrePuntajeBusqueda[0]
    cmp al, '$'
    je mSalir

    add si,SIZEOF nombrePuntajeBusqueda
    add si,SIZEOF numPuntajeBusqueda
    jmp mInicio

    mSalir:
    mov desPuntaje, si


endm

recorrerPuntajes macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
    xor si,si

    mInicio:
    push si
    LimpiarLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,'$'
    pop si

    mov di,si
    leerFDesplazado SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF nombrePuntajeBusqueda
    leerFDesplazado SIZEOF numPuntajeBusqueda,numPuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF numPuntajeBusqueda
    
    mov al, nombrePuntajeBusqueda[0]
    cmp al, '$'
    je mSalir

    push si
    printLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda
    printChar ' '
    printChar '-'
    printChar ' '
    mov ax,numPuntajeBusqueda
    PAnyNumber

    pop si

    add si,SIZEOF nombrePuntajeBusqueda
    add si,SIZEOF numPuntajeBusqueda
    jmp mInicio

    mSalir:

endm

recorrerPuntajesVideo macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio
    
    xor si,si
    mov contadorTabulacion,1d

    mInicio:
    
    push si
    LimpiarLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,'$'
    pop si

    mov di,si
    leerFDesplazado SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF nombrePuntajeBusqueda
    leerFDesplazado SIZEOF numPuntajeBusqueda,numPuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF numPuntajeBusqueda
    
    mov al, nombrePuntajeBusqueda[0]
    cmp al, '$'
    je mSalir

    push si
    save16bits numPuntajeBusqueda,MovimientoTexto


    pintartexto nombrePuntajeBusqueda,contadorTabulacion,2,47
    pintartexto barrita,contadorTabulacion,6,47
    pintartexto MovimientoTexto,contadorTabulacion,8,47

    inc contadorTabulacion
   

    pop si

    add si,SIZEOF nombrePuntajeBusqueda
    add si,SIZEOF numPuntajeBusqueda
    jmp mInicio

    mSalir:

endm

InsertarEnArray macro destino, origen, desplazamiento, longitud
    LOCAL copy_loop
    mov si, offset origen
    mov di, offset destino + desplazamiento 
    mov cx, longitud 

    copy_loop:
    mov al, [si] 
    mov [di], al 
    inc si 
    inc di 
    loop copy_loop 
endm

ValidarRanking macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio,Sustituir,next,mSalirEscirbir
    xor si,si
    mov validationRanking,0b
    mov desPuntaje,0d
    
    mInicio: 
    cmp si,50d   
    je mSalir

    push si
    LimpiarLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,'$'
    pop si

    mov di,si
    leerFDesplazado SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF nombrePuntajeBusqueda
    leerFDesplazado SIZEOF numPuntajeBusqueda,numPuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF numPuntajeBusqueda


    
    mov al, nombrePuntajeBusqueda[0]
    cmp al, '$'
    je mSalirEscirbir


    
    mov ax, numPuntaje
    cmp ax, numPuntajeBusqueda
    jb mSalirEscirbir
    jmp next


    next:
    add si,SIZEOF nombrePuntajeBusqueda
    add si,SIZEOF numPuntajeBusqueda
    jmp mInicio

    mSalirEscirbir:
    mov validationRanking,1b
    mov desPuntaje, si
    mov ax, desPuntaje
    PAnyNumber

    mSalir:
    
endm

EscribirPuntaje macro
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio,Sustituir,next,mSalirEscirbir
    mov si,desPuntaje

    mInicio: 
    cmp si,50d   
    je mSalir

    push si
    LimpiarLimited SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,'$'
    pop si

    mov di,si
    leerFDesplazado SIZEOF nombrePuntajeBusqueda,nombrePuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF nombrePuntajeBusqueda
    leerFDesplazado SIZEOF numPuntajeBusqueda,numPuntajeBusqueda,handle_puntaje,di
    add di, SIZEOF numPuntajeBusqueda


    
    mov al, nombrePuntajeBusqueda[0]
    cmp al, '$'
    je mSalirEscirbir


    
    mov ax, numPuntaje
    cmp ax, numPuntajeBusqueda
    jb Sustituir
    jmp next

    Sustituir:
    mov di,si
    editarFDesplazado SIZEOF nombrePuntaje,nombrePuntaje,handle_puntaje,di
    add di, SIZEOF nombrePuntaje
    editarFDesplazado SIZEOF numPuntaje,numPuntaje,handle_puntaje,di

    mov ax, numPuntajeBusqueda
    mov numPuntaje,ax

    push si
    InsertarEnArray nombrePuntaje, nombrePuntajeBusqueda, 0, SIZEOF nombrePuntaje
    pop si

    next:
    add si,SIZEOF nombrePuntajeBusqueda
    add si,SIZEOF numPuntajeBusqueda
    jmp mInicio

    mSalirEscirbir:
    mov di, si
    editarFDesplazado SIZEOF nombrePuntaje,nombrePuntaje,handle_puntaje,di
    add di, SIZEOF nombrePuntaje
    editarFDesplazado SIZEOF numPuntaje,numPuntaje,handle_puntaje,di


    mSalir:

endm

ArreglarNum2Digitos macro array1 
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

    xor si,si
    mov al, array1[0]
    mov ah, array1[1]

    mInicio:
    cmp ah,'$'
    jne mSalir

    mov array1[1],al
    mov array1[0],'0'

    mSalir:

endm

ArreglarNum4Digitos macro array1 
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

    xor si,si

    mov al, array1[1]
    cmp al, '$'
    je v1

    mov al, array1[2]
    cmp al, '$'
    je v2

    mov al, array1[3]
    cmp al, '$'
    je v3

    v1:
    mov al,array1[0]

    mov array1[3],al
    mov array1[0],'$'
    jmp mSalir

    v2:
    mov al,array1[0]
    mov ah,array1[1]

    mov array1[2],al
    mov array1[3],ah
    mov array1[0],'$'
    mov array1[1],'$'
    jmp mSalir

    v3:
    mov al,array1[0]
    mov ah,array1[1]
    mov bl,array1[2]

    mov array1[1],al
    mov array1[2],ah
    mov array1[3],bl

    mov array1[0],'$'
    jmp mSalir

    mSalir:

endm

save16bits macro var,texto
    LimpiarLimited SIZEOF texto,texto,'$'
    mov ax,var
    SavePAnyNumber texto

    RemplazarChar SIZEOF texto, texto, '$', ' '

endm

save8bits macro var,texto
    LimpiarLimited SIZEOF texto,texto,'$'
    xor ax,ax
    mov al,var
    SavePAnyNumber texto
    ArreglarNum2Digitos texto

endm

RemplazarChar macro numbytes, array1, charOrigen, charDestino
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

    xor si,si
    mov al, charOrigen
    mov ah, charDestino

    mInicio:
    cmp si, numbytes
    je mSalir

    cmp al,array1[si]
    je v1
    jmp v2

    v1:
    mov array1[si],ah

    v2:
    inc si
    jmp mInicio

    mSalir:

endm

SavePAnyNumber macro var      
    LOCAL label1,print1,salir
    mov cx,0
    mov dx,0
    
       label1:
        xor di,di
        cmp ax,0
        je print1     
        mov bx,10       
        div bx                   
        push dx             
        inc cx             
        xor dx,dx
        jmp label1
    print1:
        cmp cx,0
        je salir
        pop dx
        add dx,48
        mov var[di],dl
        inc di

        dec cx
        jmp print1
    salir: 
endm

Hora macro hora,minuto,segundo
    xor bx,bx
	mov ah,02ch
	int 21H
	mov hora,ch
	mov minuto,cl
    mov segundo,dh
	mov bl,dh
endm

Segundo macro segundo
    xor bx,bx
	mov ah,02ch
	int 21H
    mov segundo,dh
	mov bl,dh
endm

SalirTodoProgramaM macro
   exitPrograma:
   FinalizarPrograma
endm

FinalizarPrograma macro    
    xor al,al
    mov ah,4ch
    int 21h 
endm

getChar macro 
    mov ah, 01h
    int 21h
endm

printChar macro char
    mov ah,02h
    mov dl, char
    int 21h
endm

print macro cadena
    mov ah, 09h
    mov dx, offset cadena
    int 21h
endm

println macro cadena
   print cadena
	printChar 10d
endm

LimpiarLimited macro numbytes,array, char 
    LOCAL getCadena, finCadena
    xor si,si
    mov di,numbytes
    getCadena:
        cmp si,di
        je finCadena
        mov al,char
        mov array[si],al
        inc si
        jmp getCadena
    finCadena:
endm

readNextChar macro
    LimpiarLimited SIZEOF crr_caracter,crr_caracter,'$'
    leerFDesplazado SIZEOF crr_caracter,crr_caracter,hanlde_nv,desplazamiento_lectura
endm

readAllFile macro nivel,jI_x,jI_y,errJugador,errCajas,estadoErr,nivel_original
    LOCAL mStart,mFin,v0,v1,v2,v3,v4,v5,increment,pTemp,Rnum1,Rnum2,SRnum,SGestionData, T1,T2,T3,T4,T5,TS,e1,e2,e3,cargarATablero,esalida,efinal,FF,SaltarInicPos,errJugadorMsg,ErrCajasMsg,SaltarErrores,GuardarNormal,GuardarOriginal,SGuardar,Gambos
    mov estadoErr,0d
    mov contadorCajas,0d
    mov contadorObjetivos,0d
   
    mStart:
    mov desplazamiento_lectura,0d
    mov read_num,1d

    pTemp:
    cmp read_num,2d
    jne v0
    ArreglarNum2Digitos num_temp1
    ArreglarNum2Digitos num_temp2

    mov tipo_objeto,0d
    mov objeto_x, 99d
    mov objeto_y, 99d

    compararArray SIZEOF text_objetivo,text_objetivo,text_temp
    cmp comparar_cadenas,0b
    je T1

    compararArray SIZEOF text_caja,text_caja,text_temp
    cmp comparar_cadenas,0b
    je T2
    
    compararArray SIZEOF text_suelo,text_suelo,text_temp
    cmp comparar_cadenas,0b
    je T3

    compararArray SIZEOF text_pared,text_pared,text_temp
    cmp comparar_cadenas,0b
    je T4

    compararArray SIZEOF text_jugador,text_jugador,text_temp
    cmp comparar_cadenas,0b
    je T5

    jmp TS

    T1: ;o-> objetivo
    inc contadorObjetivos
    mov caracter_objeto,'o'
    mov tipo_objeto,1d
    jmp TS

    T2: ; c-> caja,
    inc contadorCajas
    mov caracter_objeto,'c'
    mov tipo_objeto,2d
    jmp TS

    T3: ; s->suelo,
    mov caracter_objeto,'s'
    mov tipo_objeto,3d
    jmp TS

    T4: ; p-> pared
    mov caracter_objeto,'p'
    mov tipo_objeto,4d
    jmp TS

    T5: ; j-> jugador
    mov caracter_objeto,'j'
    mov tipo_objeto,5d
    jmp TS

    TS:
    cadenaToSword2 num_temp1,objeto_x
    cadenaToSword2 num_temp2,objeto_y

    cmp tipo_objeto,0d
    je e1

    cmp objeto_x,39d ; 0 a 30 -> 40 px
    ja e2

    cmp objeto_y,22d ; 0 a 22 -> 23 px
    ja e3

    jmp cargarATablero

    e1:
    println msg_err_tipo
    mov estadoErr,1b
    jmp efinal

    e2:
    println msg_err_x
    mov estadoErr,1b
    jmp efinal

    e3:
    println msg_err_y
    mov estadoErr,1b
    jmp efinal

    cargarATablero:

    calcPosTablero objeto_x,objeto_y

    cmp caracter_objeto, 'j'
    jne SaltarInicPos
    mov ax,objeto_x
    mov jI_x,ax
    mov ax,objeto_y
    mov jI_y,ax

    SaltarInicPos:
    mov si,posicion_tablero
    mov al,caracter_objeto

    cmp caracter_objeto, 'j'
    je GuardarNormal
    cmp caracter_objeto, 'c'
    je GuardarNormal
    cmp caracter_objeto, 'p'
    je Gambos
    cmp caracter_objeto, 's'
    je Gambos
    cmp caracter_objeto, 'o'
    je Gambos

    jmp GuardarOriginal

    GuardarNormal:
    mov nivel[si],al
    jmp SGuardar

    GuardarOriginal:
    mov nivel_original[si],al
    jmp SGuardar

    Gambos:
    mov nivel[si],al
    mov nivel_original[si],al
    jmp SGuardar

    SGuardar:
    
    mov read_num,1d
    LimpiarLimited SIZEOF text_temp,text_temp,'$'
    LimpiarLimited SIZEOF num_temp1,num_temp1,'$'
    LimpiarLimited SIZEOF num_temp2,num_temp2,'$'

    v0:
        readNextChar
        
        EsMinuscula crr_caracter
        cmp validarEsMinuscula,0b
        je v1

        cmp crr_caracter,','
        je v2

        EsNumero crr_caracter
        cmp validarEsNumero,0b
        je v3

        cmp crr_caracter,'$'
        je mFin

        jmp increment

    v1:
        readNextChar

        EsMinuscula crr_caracter
        cmp validarEsMinuscula,0b
        jne pTemp

        addCharToArray SIZEOF text_temp,text_temp,crr_caracter
    
        inc desplazamiento_lectura
        jmp v1

    v2:
        inc read_num
        jmp increment

    v3:
        readNextChar

        EsNumero crr_caracter
        cmp validarEsNumero,0b
        jne pTemp
        
        cmp read_num,1d
        je Rnum1
        jmp Rnum2

        Rnum1:
        addCharToArray SIZEOF num_temp1,num_temp1,crr_caracter
        jmp SRnum

        Rnum2:
        addCharToArray SIZEOF num_temp2,num_temp2,crr_caracter

        SRnum:
        inc desplazamiento_lectura
        jmp v3

    increment:
        inc desplazamiento_lectura
        jmp v0
   

    efinal:
        println msg_err_nivel
        mov estadoErr,1b
        jmp FF
    mFin:  
      
    FF:

    cmp jI_x,100d
    je errJugadorMsg

    mov ax,contadorObjetivos
    cmp contadorCajas,ax
    jne  ErrCajasMsg

    jmp SaltarErrores

    errJugadorMsg:
    mov estadoErr,1b
    println errJugador
    getChar

    ErrCajasMsg:
    mov estadoErr,1b
    println errCajas
    getChar

    SaltarErrores:

    println msg_salir_lectura

endm

compararArray macro numbytes, array1,array2
    LOCAL mSalir,v1,v2,v3,v4,v5,v6,mInicio

    mov comparar_cadenas,0b
    xor si,si

    mInicio:
    cmp si,numbytes
    je mSalir

    mov al, array1[si]
    mov ah, array2[si]
    inc si
    cmp al, ah
    je mInicio

    mov comparar_cadenas,1b

    mSalir:
endm

addCharToArray macro numbytes, array, char
    LOCAL mStart,mFin,v0,v1,v2,v3,v4,v5
    xor si,si

    mStart:
    cmp si,numbytes
    je mFin
  
    cmp array[si],'$'
    je v0

    inc si
    jmp mStart

    v0:
    mov al, char
    mov array[si],al

    mFin:
endm

printLimited macro numbytes,array 
    LOCAL getCadena, finCadena
    xor si,si
    mov di,numbytes
    getCadena:
      
        cmp si,di
        je finCadena
        printChar array[si] 
        inc si
        jmp getCadena
    finCadena:
endm

printLimitedln  macro numbytes,array	
    printLimited numbytes,array
    printChar 10d
endm

printTablero macro numbytes,array 
    LOCAL mStart, mEnd,v1,v2,v3,v4
    xor si,si
    xor di,di
    mStart:
        cmp si,numbytes
        je mEnd

        printChar array[si] 
        
        cmp di,39d
        je v1
        jmp v2

        v1:
        printChar 10d
        xor di,di
        jmp v3

        v2:
        inc di

        v3:
        inc si
        jmp mStart

    mEnd:
endm

printTableroVideo macro numbytes,array 
    LOCAL mStart, mEnd,v1,v2,v3,v4,v5,v6,v7,v8,v9,v10
    xor si,si
    xor di,di
    mov pintarx,0d
    mov pintary,0d
    
    mStart:
        cmp si,numbytes
        je mEnd

        mov ax,pintarx
        mov bx,8d
        mul bx
        mov pintarxPx,ax

        mov ax,pintary
        mov bx,8d
        mul bx
        mov pintaryPx,ax

        mov al, array[si] 
      
        push si
        cmp al,'o'
        je v1

        cmp al,'c'
        je v2

        cmp al,'s'
        je v3

        cmp al,'p'
        je v4

        cmp al,'j'
        je v5

        cmp al,'$'
        je v6

        v1:
        dibujarcuadroSprite  pintaryPx,pintarxPx,8,8,sprite_obj
        jmp v7

        v2:
        dibujarcuadroSprite pintaryPx,pintarxPx,8,8,sprite_caja
        jmp v7

        v3:
        dibujarcuadroSprite  pintaryPx,pintarxPx,8,8,sprite_suelo
        jmp v7

        v4:
        dibujarcuadroSprite  pintaryPx,pintarxPx,8,8,sprite_pared
        jmp v7

        v5:
        dibujarcuadroSprite  pintaryPx,pintarxPx,8,8,sprite_jug
        jmp v7

        v6:
        dibujarcuadroSprite  pintaryPx,pintarxPx,8,8,sprite_nada
        jmp v7

        v7:
        cmp pintarx ,39d
        je v8
        jmp v9

        v8:
        mov pintarx,0d
        inc pintary
        jmp v10

        v9:
        inc pintarx
       
        v10:
        pop si
        inc si
        jmp mStart

    mEnd:
endm

EsNumero macro char	
    LOCAL v1,v2,mfin
        mov validarEsNumero,0b

        cmp char,48d ;limite inferior 0
        jae v1
        jmp v2
        
        v1:
        cmp char,57d ;limite superior 9
        jbe mfin

        v2:
        mov validarEsNumero,1b
        
    mfin:
endm	

EsMinuscula macro char 
    LOCAL v1,v2,mfin

    mov validarEsMinuscula,0b

    cmp char,97d ;limite inferior a
    jae v1
    jmp v2
    
    v1:
    cmp char,122d ;limite superior z
    jbe mfin

    v2:
    mov validarEsMinuscula,1b
        
    mfin:
endm

PAnyNumber macro          
    LOCAL label1,print1,salir
    mov cx,0
    mov dx,0
    label1:
        cmp ax,0
        je print1     
        mov bx,10       
        div bx                   
        push dx             
        inc cx             
        xor dx,dx
        jmp label1
    print1:
        cmp cx,0
        je salir
        pop dx
        add dx,48
        mov ah,02h
        int 21h
        dec cx
        jmp print1
    salir:
    printChar 10d
endm

cadenaToSword2 macro texto,var	
    LOCAL buclerecorrercadena,FinalC

    mov var,00h
    mov si,2d
    dec si
    xor ax,ax   
    mov bx,1
    
    buclerecorrercadena:  
        mov al,texto[si]
        sub ax,030h 
        mul bx
        add var, ax
        mov ax,0Ah 
        mul bx
        mov bx,ax
        cmp si,00h
        je FinalC
        xor ax,ax
        dec si 
        jmp buclerecorrercadena
    FinalC:
    
endm

LimpiarPantalla macro	
    setModeGrafico
    setModoTexto
endm

setModoTexto macro 
    mov ax, 0003h
    int 10h
endm

setModeGrafico macro 
    mov ax, 0013h
    int 10h
endm

abrirF macro ruta,handle,mensaje
    LOCAL v1,v2,v3,v4
    mov ah,3dh
    mov al,10b
    lea dx,ruta
    int 21h
    mov handle,ax
    jc v1
    jmp v2

    v1:

    v2:
endm

abrirFNivel macro ruta,handle,estadoLeido_nv
    LOCAL v1,v2,v3,v4
    mov ah,3dh
    mov al,10b
    lea dx,ruta
    int 21h
    mov handle,ax
    jc v1
    jmp v2

    v1:
    mov estadoLeido_nv,0b
    jmp v3


    v2:
    mov estadoLeido_nv,1b

    v3:
endm

cerrarF macro handle
    mov ah, 3Eh
    mov bx, handle 
    int 21h
endm

abrirNonExist macro ruta,handle
    LOCAL NonProdBin, mSalir,mStart

    mStart:
    mov ah,3dh
    mov al,10b
    lea dx,ruta
    int 21h
    mov handle,ax
    jc NonProdBin
    jmp mSalir
    NonProdBin: 
        crearF ruta
        jmp mStart
    mSalir:
endm

crearF macro ruta
    LOCAL v1,v2,v3,v4
    mov ah,3ch
    mov cx,0
   
    mov dx,offset ruta
    int 21h
    jc v1 
    jmp v2
    v1:
    FinalizarPrograma
    v2:
    mov bx,ax
    mov ah,3eh 
    int 21h
endm

moverPuntero macro handle,desplazamiento
    mov ah, 42h 
    mov al, 0 
    mov bx, handle 
    mov cx, 0 
    mov dx, desplazamiento 
    int 21h
endm

leerFDesplazado macro numbytes,buffer,handle,desplazamiento
    moverPuntero handle,desplazamiento

    mov ah, 3Fh
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

moverPunteroFinal macro handle,desplazamiento
    mov ah, 42h 
    mov al, 2 
    mov bx, handle
    mov cx, 0d 
    mov dx, desplazamiento
    int 21h
endm

editarFDesplazadoFinal macro  numbytes,buffer,handle,desplazamiento
    moverPunteroFinal handle,desplazamiento
    mov ah, 40h
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

editarFDesplazado macro  numbytes,buffer,handle,desplazamiento
    moverPuntero handle,desplazamiento
    mov ah, 40h
    mov bx, handle
    mov cx, numbytes
    mov dx, offset buffer
    int 21h
endm

dibujarcuadro MACRO x, y, ancho, alto, color
    LOCAL RECORRER_X, RECORRER_Y
 
    MOV CX, ancho
    MOV AX, x
    MOV coord_x, AX

    RECORRER_X:
       
        PUSH CX

      
        MOV CX, alto
        MOV AX, y
        MOV coord_y, AX

        RECORRER_Y:
           
            pintarPixel coord_x, coord_y, color

            INC coord_y
            LOOP RECORRER_Y

      
        POP CX

        
        INC coord_x
        LOOP RECORRER_X
ENDM

pintartexto MACRO cadena, fila, columna, color
  
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH BP

   
    MOV AL, 1
    MOV BH, 0
    MOV BL, color
    MOV CX, LENGTHOF cadena
    MOV DH, fila
    MOV DL, columna

   
    memoriaDS

   
    MOV BP, OFFSET cadena
    MOV AH, 13H
    INT 10H

    
    cambiaravideo

    POP BP
    POP DX
    POP CX
    POP BX
    POP AX
ENDM

pintarpixelpro macro x,y,color
    mov ah,0ch  
    mov al,color   
    mov cx,y  
    mov dx,x 
    int 10h
endm

pintarpixel MACRO x, y, color

    PUSH AX
    PUSH BX
    PUSH DX
    PUSH SI

    MOV AX, y
    MOV BX, 320
    MUL BX
    ADD AX, x


    MOV SI, AX
	
    MOV BL, color
    MOV ES:[SI], BL

  
    POP SI
    POP DX
    POP BX
    POP AX
ENDM

iniciarmodovideo macro
    push ax
    xor ax,ax
    mov ax,12h
    int 10h
    pop ax
endm

cambiaravideo macro
	push dx
	mov dx,0a000h
	mov es,dx
	pop dx
endm

entraramodovideo macro
    push ax
    mov ah,0
    mov al,13h
    int 10h
    pop ax
endm

memoriaDS MACRO

    PUSH DX

   
    MOV DX, @DATA
    MOV ES, DX

 
    POP DX
ENDM


CacularTranscurrido macro segundoInit,segundoCrr,segundosTranscurridos,minutosTranscurridos,horasTranscurridas
    LOCAL v1,v2,v3

    mov al,segundoCrr
    cmp segundoInit,al
    je v1

    mov segundoInit,al

    inc segundosTranscurridos
    cmp segundosTranscurridos,60d
    jbe v1

    mov segundosTranscurridos,0d

    inc minutosTranscurridos
    cmp minutosTranscurridos,60d
    jbe v1

    mov minutosTranscurridos,0d

    inc horasTranscurridas

    v1:
endm

ObtenerHoraTexto macro HorasTrascurridas,MinutosTrascurridos,SegundosTrascurridos
    save8bits HorasTrascurridas,HorasTexto
    save8bits MinutosTrascurridos,minutosTexto
    save8bits SegundosTrascurridos,segundosTexto
endm

TestGano macro
    LOCAL mEnd,mStart,v1,v2,v3,v4,v5,v6
    xor si,si
    mov validarGano,1b

    mStart:
    cmp si,SIZEOF tablero_nv_original
    je mEnd

    mov al,tablero_nv_original[si]

    cmp al,'o'
    je v1
    jmp v2

    v1:
    mov ah, tablero_nv[si]
    cmp al,ah
    je v3

    cmp ah,'c'
    jne v3

    v2:
    inc si 
    jmp mStart

    v3:
    mov validarGano,0b


    mEnd:

endm

moverDerecha macro 
    LOCAL mEnd,mStart,mC,mAll,mT
    mStart:

    mov ax, j_x
    cmp ax,39d
    je mEnd

    mov j_xTemp,ax
    inc j_xTemp

    getPosTablero j_xTemp,j_y,pieza_TempSig
    
    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    jne mAll

    jmp mC

    mAll:
    putPosTablero j_xTemp,j_y,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_xTemp
    mov j_x,ax
    inc contadorMovimientos
    jmp mEnd

    mC:
    mov ax,j_xTemp
    cmp ax,39d
    je mEnd

    mov j_xTemp_C,ax
    inc j_xTemp_C

    getPosTablero j_xTemp_C,j_y,pieza_TempSig

    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    je mEnd

    putPosTablero j_xTemp_C,j_y,'c'
    putPosTablero j_xTemp,j_y,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_xTemp
    mov j_x,ax
    inc contadorMovimientos
    jmp mEnd

    mEnd:

endm

moverArriba macro 
    LOCAL mEnd,mStart,mC,mAll,mT
    mStart:

    mov ax, j_y
    cmp ax,0d
    je mEnd

    mov j_yTemp,ax
    dec j_yTemp

    getPosTablero j_x,j_yTemp,pieza_TempSig
    
    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    jne mAll

    jmp mC

    mAll:
    putPosTablero j_x,j_yTemp,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_yTemp
    mov j_y,ax
    inc contadorMovimientos
    jmp mEnd

    mC:
    mov ax,j_yTemp
    cmp ax,0d
    je mEnd

    mov j_yTemp_C,ax
    dec j_yTemp_C

    getPosTablero j_x,j_yTemp_C,pieza_TempSig

    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    je mEnd

    putPosTablero j_x,j_yTemp_C,'c'
    putPosTablero j_x,j_yTemp,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_yTemp
    mov j_y,ax
    inc contadorMovimientos
    jmp mEnd

    mEnd:

endm

moverIzquierda macro 
    LOCAL mEnd,mStart,mC,mAll,mT
    mStart:

    mov ax, j_x
    cmp ax,0d
    je mEnd

    mov j_xTemp,ax
    dec j_xTemp

    getPosTablero j_xTemp,j_y,pieza_TempSig
    
    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    jne mAll

    jmp mC

    mAll:
    putPosTablero j_xTemp,j_y,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_xTemp
    mov j_x,ax
    inc contadorMovimientos
    jmp mEnd

    mC:
    mov ax,j_xTemp
    cmp ax,0d
    je mEnd

    mov j_xTemp_C,ax
    dec j_xTemp_C

    getPosTablero j_xTemp_C,j_y,pieza_TempSig

    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    je mEnd

    putPosTablero j_xTemp_C,j_y,'c'
    putPosTablero j_xTemp,j_y,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_xTemp
    mov j_x,ax
    inc contadorMovimientos
    jmp mEnd

    mEnd:

endm

moverAbajo macro 
    LOCAL mEnd,mStart,mC,mAll,mT
    mStart:

    mov ax, j_y
    cmp ax,22d
    je mEnd

    mov j_yTemp,ax
    inc j_yTemp

    getPosTablero j_x,j_yTemp,pieza_TempSig
    
    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    jne mAll

    jmp mC

    mAll:
    putPosTablero j_x,j_yTemp,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_yTemp
    mov j_y,ax
    inc contadorMovimientos
    jmp mEnd

    mC:
    mov ax,j_yTemp
    cmp ax,22d
    je mEnd

    mov j_yTemp_C,ax
    inc j_yTemp_C

    getPosTablero j_x,j_yTemp_C,pieza_TempSig

    cmp pieza_TempSig,'p'
    je mEnd

    cmp pieza_TempSig,'c'
    je mEnd

    putPosTablero j_x,j_yTemp_C,'c'
    putPosTablero j_x,j_yTemp,'j'
    getPosTableroOriginal j_x,j_y,pieza_Temp
    putPosTablero j_x,j_y,pieza_Temp
    mov ax,j_yTemp
    mov j_y,ax
    inc contadorMovimientos
    jmp mEnd

    mEnd:

endm

getPosTablero macro x,y,char
    calcPosTablero x,y 
    mov si,posicion_tablero
    mov al,tablero_nv[si]
    mov char,al
endm

getPosTableroOriginal macro x,y,char
    calcPosTablero x,y 
    mov si,posicion_tablero
    mov al,tablero_nv_original[si]
    mov char,al
endm

putPosTablero macro x,y,pieza 
    calcPosTablero x,y 
    mov si,posicion_tablero
    mov al,pieza
    mov tablero_nv[si],al
endm

calcPosTablero macro x,y 
    push ax
    push bx
    xor ax,ax
    xor bx,bx
 
    mov ax, y
    mov bx,40d
    mul bx
    add ax,x

    mov posicion_tablero,ax

    pop bx
    pop ax
endm

InsertarEnArray macro destino, origen, desplazamiento, longitud
    LOCAL copy_loop
    mov si, offset origen 
    mov di, offset destino + desplazamiento 
    mov cx, longitud 

    copy_loop:
    mov al, [si] 
    mov [di], al 
    inc si 
    inc di 
    loop copy_loop 
endm


LimpiarTableroOriginal macro  numbytes,array
    LOCAL mEnd,mStart,v1,v2,v3,v4,v5

    xor si,si
    mStart:
    cmp si,numbytes
    je mEnd

    mov al,array[si]

    cmp al,'j'
    je v1

    cmp al,'c'
    je v1

    jmp v2
    

    v1:
    mov array[si],'s'

    v2:
    inc si
    jmp mStart

    mEnd:
endm

pintarCuadricula macro

    dibujarcuadro  0, 8*0, 320, 1, 123
    dibujarcuadro  0, 8*1, 320, 1, 123
    dibujarcuadro  0, 8*2, 320, 1, 123
    dibujarcuadro  0, 8*3, 320, 1, 123
    dibujarcuadro  0, 8*4, 320, 1, 123
    dibujarcuadro  0, 8*5, 320, 1, 123
    dibujarcuadro  0, 8*6, 320, 1, 123
    dibujarcuadro  0, 8*7, 320, 1, 123
    dibujarcuadro  0, 8*8, 320, 1, 123
    dibujarcuadro  0, 8*9, 320, 1, 123
    dibujarcuadro  0, 8*10, 320, 1, 123
    dibujarcuadro  0, 8*11, 320, 1, 123
    dibujarcuadro  0, 8*12, 320, 1, 123
    dibujarcuadro  0, 8*13, 320, 1, 123
    dibujarcuadro  0, 8*14, 320, 1, 123
    dibujarcuadro  0, 8*15, 320, 1, 123
    dibujarcuadro  0, 8*16, 320, 1, 123
    dibujarcuadro  0, 8*17, 320, 1, 123
    dibujarcuadro  0, 8*18, 320, 1, 123
    dibujarcuadro  0, 8*19, 320, 1, 123
    dibujarcuadro  0, 8*20, 320, 1, 123
    dibujarcuadro  0, 8*21, 320, 1, 123
    dibujarcuadro  0, 8*22, 320, 1, 123
    dibujarcuadro  0, 8*23, 320, 1, 123
    dibujarcuadro  0, 8*24, 320, 1, 123
    dibujarcuadro  0, 8*25, 320, 1, 123


    dibujarcuadro  8*0, 0, 1, 200, 123
    dibujarcuadro  8*1, 0, 1, 200, 123
    dibujarcuadro  8*2, 0, 1, 200, 123
    dibujarcuadro  8*3, 0, 1, 200, 123
    dibujarcuadro  8*4, 0, 1, 200, 123
    dibujarcuadro  8*5, 0, 1, 200, 123
    dibujarcuadro  8*6, 0, 1, 200, 123
    dibujarcuadro  8*7, 0, 1, 200, 123
    dibujarcuadro  8*8, 0, 1, 200, 123
    dibujarcuadro  8*9, 0, 1, 200, 123
    dibujarcuadro  8*10, 0, 1, 200, 123
    dibujarcuadro  8*11, 0, 1, 200, 123
    dibujarcuadro  8*12, 0, 1, 200, 123
    dibujarcuadro  8*13, 0, 1, 200, 123
    dibujarcuadro  8*14, 0, 1, 200, 123
    dibujarcuadro  8*15, 0, 1, 200, 123
    dibujarcuadro  8*16, 0, 1, 200, 123
    dibujarcuadro  8*17, 0, 1, 200, 123
    dibujarcuadro  8*18, 0, 1, 200, 123
    dibujarcuadro  8*19, 0, 1, 200, 123
    dibujarcuadro  8*20, 0, 1, 200, 123
    dibujarcuadro  8*21, 0, 1, 200, 123
    dibujarcuadro  8*22, 0, 1, 200, 123
    dibujarcuadro  8*23, 0, 1, 200, 123
    dibujarcuadro  8*24, 0, 1, 200, 123
    dibujarcuadro  8*25, 0, 1, 200, 123
    dibujarcuadro  8*26, 0, 1, 200, 123
    dibujarcuadro  8*27, 0, 1, 200, 123
    dibujarcuadro  8*28, 0, 1, 200, 123
    dibujarcuadro  8*29, 0, 1, 200, 123
    dibujarcuadro  8*30, 0, 1, 200, 123
    dibujarcuadro  8*31, 0, 1, 200, 123
    dibujarcuadro  8*32, 0, 1, 200, 123
    dibujarcuadro  8*33, 0, 1, 200, 123
    dibujarcuadro  8*34, 0, 1, 200, 123
    dibujarcuadro  8*35, 0, 1, 200, 123
    dibujarcuadro  8*36, 0, 1, 200, 123
    dibujarcuadro  8*37, 0, 1, 200, 123
    dibujarcuadro  8*38, 0, 1, 200, 123
    dibujarcuadro  8*39, 0, 1, 200, 123
    dibujarcuadro  8*40, 0, 1, 200, 123

endm

limpiarpantalla macro
    mov ah, 00h
    mov al, 03h
    int 10h
endm    

LimpiarModoVideo macro
	limpiarpantalla
	call cambiartodoavideo
endm

LeerNiveles macro
    LOCAL mStart,mEnd,v1,v2,v3,v4,v5,v6
    LimpiarModoVideo
    mStart:

    abrirFNivel ruta_nv1,hanlde_nv,estadoLeido_nv1
    cmp estadoLeido_nv1, 1b
    jne v1
    
    readAllFile tablero_nv1,j1_x,j1_y,msg_errJugaor_nv1,msg_errCajas_nv1,estadoErr_nv1,tablero_nv1_original
    cerrarF hanlde_nv

    abrirFNivel ruta_nv2,hanlde_nv,estadoLeido_nv2
    cmp estadoLeido_nv2, 1b
    jne v2

    readAllFile tablero_nv2,j2_x,j2_y,msg_errJugaor_nv2,msg_errCajas_nv2,estadoErr_nv2,tablero_nv2_original
    cerrarF hanlde_nv

    abrirFNivel ruta_nv3,hanlde_nv,estadoLeido_nv3
    cmp estadoLeido_nv3, 1b
    jne v3

    readAllFile tablero_nv3,j3_x,j3_y,msg_errJugaor_nv3,msg_errCajas_nv3,estadoErr_nv3,tablero_nv3_original
    cerrarF hanlde_nv

    jmp v4

    v1:
        showMesajePantalla msg_erro_nv1
        jmp v5
    v2:
        showMesajePantalla msg_erro_nv2
        jmp v5
    v3:
        showMesajePantalla msg_erro_nv3
        jmp v5
    v4:
        showMesajePantalla msg_correcto
        jmp v5
    v5:
        pintartexto msg_SganoF,10,4,47 
        enterKey

    mEnd:

endm

ValidarNiveles macro
    LOCAL mStart,mEnd,v1,v2,v3,v4,v5,v6
    LimpiarModoVideo

    println test1
    cmp estadoLeido_nv1, 1b
    jne v1
    
    println test2
    cmp estadoLeido_nv2, 1b
    jne v1

    println test3
    cmp estadoLeido_nv3, 1b
    jne v1

    println test4
    cmp estadoErr_nv1, 1b
    je v1

    println test5
    cmp estadoErr_nv2, 1b
    je v1

    println test6
    cmp estadoErr_nv3, 1b
    je v1

    jmp v2

    v1:
        
        showMesajePantalla msg_error_nv
        getChar
        jmp Iniciar
    v2:
       
    mEnd:

endm

showMesajePantalla macro mensaje
    pintartexto mensaje,15,0,47
endm

enterKey macro
    LOCAL v1,v2,v3,v4
    v1:
        call HasKey
        jz v1

        xor ax,ax
        call GetKey 

        cmp ax, 1C0Dh;enter
        je v2

        jmp v1
    v2:
endm

enterKeyConfig macro texto,guardar
    LOCAL v1,v2,v3,v4
    LimpiarModoVideo
    pintartexto texto,2,5,47
    v1:
        call HasKey
        jz v1

        xor ax,ax
        call GetKey 

        mov guardar, ax

    v2:
endm

clasificarPieza macro tecla,texto
    LOCAL mStart, mEnd,v1,v2,v3,v4,v5,v6,v7
    LimpiarLimited SIZEOF texto,texto,' '

    mStart:
    mov ax,tecla

    cmp al,0d
    je v1

    jmp v7


    v1:
   

    cmp ah,4Dh ;derecha
    je v2

    cmp ah,4Bh ;izquierda
    je v3

    cmp ah,48h ;arriba
    je v4

    cmp ah,50h ;abajo
    je v5

    jmp v6

    v2:
    InsertarEnArray texto,testDefaulRigth,0,SIZEOF testDefaulRigth
    jmp mEnd

    v3:
    InsertarEnArray texto,testDefaulLeft,0,SIZEOF testDefaulLeft
    jmp mEnd

    v4:
    InsertarEnArray texto,testDefaulUp,0,SIZEOF testDefaulUp
    jmp mEnd

    v5:
    InsertarEnArray texto,testDefaulDow,0,SIZEOF testDefaulDow
    jmp mEnd

    v6:
    InsertarEnArray texto,testDefaulOtro,0,SIZEOF testDefaulOtro
    jmp mEnd

    v7:
    mov texto[0],al


    mEnd:

endm