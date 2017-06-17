#!/bin/bash

ganome-terminal -e "/bin/bash -c 'sudo nasm -f $1;ld -m elf_i386 -s -o $2 $2;./$2; echo;read -p 'pulse_intro_para_salir....';exit;exec /bin/bash';&"
