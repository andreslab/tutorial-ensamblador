%macro escribe 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 0x80
%endmacro

segment .data
msg1 db 0x1b,"[47;32m",0x1b,"[3m","HOLAAAAA",0xA,0x1b,"[40;37m"
len1 equ $-msg1
;FORMATO ITALICO CON EL 3m


msg2 db  0x1b,"[42;32m","-------",0x1b,"[45;35m","-------",0xA,0x1b,"[40;37m"

;ES NECESARIO AGREGAR [ PARA DECLARAR INSTRUCCIONES
;30 AL 37 ELEGIMOS LOS COLORES, EN ESTE CASO 32 Y LA m INDICA QUE ES PARA COLOR
;40 AL 47 ELEGIMOS EL COLOR DEL FONDO EN ESTE CASO 42
;TODO DESPUES DE 42,32m TENDRA UN COLOR
;COLOCAR OTRA VEZ 0x1b INDICA QUE SE DECLARA OTRA INSTRUCCION
;RECORDAR 0xA  ES UN SALTO DE LINEA

len2 equ $-msg2

msg3 db 0x1b,"[45;35m","-------",0x1b,"[42;32m","-------",0xA,0x1b,"[40;37m"
len3 equ $-msg3



msg4 db 0x1b,"[80;54f",0x1b,"[40;32m","HOLAAA2",0xA,0x1b,"[40;37m"
len4 equ $-msg4
;POR LA INSTRUCCION 80,54F HACE EL SALTO DEL CURSOR

segment .bss
res resb 2

segment .text

leetecla:
	mov eax, 3
	mov ebx, 0
	mov edx, 2
	int 0x80
ret

global _start

_start:

escribe msg1, len1
escribe msg2, len2
escribe msg3, len3
escribe msg4, len4

salir:
 mov eax, 1
 xor ebx, ebx
 int 0x80






