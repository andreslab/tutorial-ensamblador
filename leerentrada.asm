section .data
	entrada db 'ingrese numero: ',0xA,0xD
	lenentrada equ $ - entrada
	salida db 'el numero ingresado es: ',0xA,0xD
	lensalida equ $ - salida

section .bss
	num resb 5;reservacion de 5 bytes o 5 unidades o 5 elmentos

section .text
	global _start
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, entrada
	mov edx, lenentrada
	int 0x80


	;entrada por teclado
	mov eax, 3
	mov ebx, 2
	mov ecx, num ;mensaje pantalla
	mov edx, 5   ;espacio del numero entrante
	int 0x80


	mov eax, 4
	mov ebx, 1
	mov ecx, salida
	mov edx, lensalida
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80

	;4 caracteres visibles y 1 caracter invisible que realiza el de return, 
	;sino agregar add eax, '0', para que realice la función de caracter invisible 

	mov eax, 1
	int 0x80


