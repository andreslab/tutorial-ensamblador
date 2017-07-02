segment .data
msg1 db "ingrese cinco numeros y presione enter:", 0xA
len1 equ $-msg1

msg3 db "el mayor de estos numeros es: "
len3 equ $-msg3

arre db 0,0,0,0,0
la equ $-arre

msg2 db  0xA
lm2 equ $-msg2


segment .bss
res resb 2

segment .text

global _start

_start:

mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, len1
int 0x80

		;esi y edi registros que permiten almacenar informacion
mov esi, arre   ;guardara la poscion de memoria de la variable arre
mov edi, 0	;valor de control, en cada vuelta aumentara en 1 para la posicion del arreglo

lee:
mov eax, 3
mov ebx, 0
mov ecx, res  ;guarda la informacion ingresada en res
mov edx, 2
int 0x80

mov al, [res]  ;inserta en "al" el valor de res
sub al, '0'	;le resta 0 o el salto de linea para usarlo como numero

mov [esi], al	;guarda el contenido de al en esi q a su ves tiene la posicion de memoria de arre
 
add esi, 1	;aumentos la posicion de esi q posee arre en 1 y asi se situa en la segunda posicioon del arreglo
add edi, 1	;tamb aumentamos edi en 1 para tener la referencia de la posicion

cmp edi, la	;la tienen la longitud maxima de arre
jb lee		;pregunamos si edi es menor que la, si es correcto vamos a la etiqueta lee


mov ecx, 0	;
mov bl, 0   	;almacenar el numero mas grande de nuestro arreglo


lp:			
mov al, [arre+ecx]	;almacenamos el valor de valor de cada posicion, la primera vez ecx es 0 asi que devolvera el valor de la primera posicion

cmp al, bl		;comparacion  al - bl
jb reg			;si bl es menor a al omite el salto a la etiqueta reg
mov bl, al		;almacenamos en bl el valor de al que no es el mayor del arreglo

reg:			;en esta etiquet ecx aumentaun posicion
inc ecx
cmp ecx, la
;salta si ecx < la
jb lp

imprimir:
	add bl, '0'
	mov [res], bl


	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lm2
	int 0x80

salir:
 mov eax, 1
 xor ebx, ebx
 int 0x80






