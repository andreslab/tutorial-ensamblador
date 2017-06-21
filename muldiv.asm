section .data

msg1 db "la multiplicacion e 2*2 es: ", 0xA, 0XD
len1 equ $ - msg1
msg2 db 0xA,0xD,"la multiplicacion de -2*-2", 0xA, 0XD
len2 equ $ - msg2
msg3 db 0xA,0xD,"la division de 4/2 es: ", 0xA, 0XD
len3 equ $ - msg3
msg4 db 0xA,0xD,"la division de -4/-2 es: ",0xA, 0XD
len4 equ $ - msg4

section .bss
res resb 1

section .text
	global _start
_start:

	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80

	

	mov eax, 2
	mov ebx, 2

	;Si se multiplica 7 * 2 sale 14 que en ascii sadra un > porque el la ubicacion del 14 en la tabla ascii	

	; eax = eax * ebx
	mul ebx 
	;no necesita poner dos operandos porque smp tomará a eax y 
	;se interpretara como mul eax, ebx
	
	add eax, '0'
	mov [res], eax 
	

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80 

	;-------------------------------------------------

	
	
	mov eax,4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80

	

	mov eax, -2
	mov ebx, -2
	;si el resultado sale negativa se representara con un caracter segun la tabla ascii	

	imul ebx ;se usara signo
	add eax, '0' 
	; arroja el resultado en forma caracter que esta en la tabla ascii, recordando 
	;que en ella no hay numero negativos

	mov [res], eax 
	

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80 

	;-------------------------------------------------


	
	mov eax,4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80

	

	mov eax, 4
	mov ebx, 2
	;esto es solo para division para almacenar en resultado y residuo
	mov edx, 0
	
	div ebx ;resultado en eax y residuo en edx
	 	
	add eax, '0' ;esto lo pasa a la tabla ascii y q se visualice
	mov [res], eax 
	

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80 

	;-------------------------------------------------


	
	mov eax,4
	mov ebx, 1
	mov ecx, msg4
	mov edx, len4
	int 0x80

	

	mov eax, -4
	mov ebx, -2
	mov edx, 0 ;para el residuo de la division
	
	idiv ebx 
	
	
	add eax, '0'
	mov [res], eax 
	

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80 

	;-------------------------------------------------

	;salir
	mov eax, 1
	int 0x80
