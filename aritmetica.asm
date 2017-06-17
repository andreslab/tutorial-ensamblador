section .data

msg1 db "la suma de 4+5 es: ",0xA,0XD
len1 equ $ - msg1
msg2 db 0xA,0xD,"la resta de 4-5 es: ",0xA,0XD ;;0xA y 0xD sirven como salto de linea
len2 equ $ - msg2
msg3 db 0xA,0xD,"el incremento en uno de eax=4 es: ",0xA, 0xD
len3 equ $ - msg3
msg4 db 0xA,0xD,"el decremento en uno de eax=4 es: ",0xA, 0xD
len4 equ $ - msg4


section .bss
	;varibales no declaradas
	;ubicacion de memoria que no a sido inicilizada
	res resb 1 ; reserve un espacio en memoria


section .text
	global _start
_start:

	; imprime los mensajes
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80
	; termine de imprimir


	;realizar la suma y colocarla en la variable res
	mov eax, 4
	mov ebx, 5 

	add eax, ebx
	add eax, '0'	;se agrega un caracter vacio apra que imprima el valor resultante de la suma
	
	; mov res, eax ; la direccion de memoria res es igual a eax, modificarems el contenido de la direccion de memoria

	mov [res], eax ; con los corchetes obtenemos el contenido de la ubicacion de meoemoria
	;no queremos modificar la direccion sino el contenido
	


	;imprimir resultado de la suma contenido en res
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1 ; porque el el tamaño que iniciamente se uso
	int 0x80


	;------------------------------------------------------

	; imprime mensaje 2
	mov eax,4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80


	;oepracion de la resta
	mov eax, 5
	mov ebx, 4
	
	sub eax, ebx
	add eax, '0' ;se agrega a la operacion para poder imprimirla 
	mov [res], eax

	;imprimir resultado de la resta
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80
	;------------------------------------------------------

	;imprime mensaje 3
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80

	;operaciond e incremento en uno

	mov eax, 4
	inc eax
	add eax, '0'
	mov [res], eax

	;imprimimos el incremento

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1 ; el tamano
	int 0x80
	
	;--------------------------------------------------------
	; imprime mensaje 4
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4

	;opracion de decremento en uno
	mov eax, 4
	dec eax
	add eax, '0'
	mov [res], eax

	;imprime el resultado del decremento
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1 ; el tamano
	int 0x80
	mov edx, len4
	int 0x80
	
