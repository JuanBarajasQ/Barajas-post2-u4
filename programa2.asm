; programa2.asm — Laboratorio Post2 Unidad 4

%include "macros.asm" ; incluir biblioteca de macros utilitarias
section .data
 titulo db "=== Macros y Control de Flujo ===", 0Dh, 0Ah, 24h
 linea_a db "[Linea A] Primera impresion", 0Dh, 0Ah, 24h
 linea_b db "[Linea B] Segunda impresion", 0Dh, 0Ah, 24h
 msg_mayor db "El valor mayor es: ", 24h
 msg_iguales db "Los valores son iguales.", 0Dh, 0Ah, 24h
 msg_fin db "Fin del programa.", 0Dh, 0Ah, 24h

section .bss
 valor_a resw 1
 valor_b resw 1

section .text
 global main

main:
 mov ax, seg titulo
 mov ds, ax

 ; 1. Encabezado con macro
 print_str titulo

 ; 2. Demostración de repetir_str
 repetir_str linea_a, 3

 ; 3. Suma 1+2+3 = 6
 mov cx, 3
 call sumar_serie ; AX = 6
 print_str msg_mayor
 print_digito ; imprime "6"
 nueva_linea

 ; 4. Comparar 9 vs 4. Mayor es 9
 mov ax, 9
 mov bx, 4
 call comparar_e_imprimir

 ; 5. Comparar 5 vs 5 (iguales)
 mov ax, 5
 mov bx, 5
 call comparar_e_imprimir

 ; 6. Mensaje final y terminación
 print_str msg_fin
 fin_dos

; Procedimientos

; Procedimiento: suma acumulativa 1+2+3+...+N
; Entrada: CX = N (número de iteraciones)
; Salida: AX = suma total
sumar_serie:
 push cx ; preservar CX (se modifica con LOOP)
 xor ax, ax ; AX = 0 (acumulador)
.paso:
 add ax, cx ; AX += CX (suma N, N-1, ..., 1)
 loop .paso ; CX--; si CX != 0, continuar
 pop cx ; restaurar CX original
 ret

; NOTA: print_digito solo imprime correctamente para resultados 0-9.
; Para resultados mayores a 9 se requiere conversión completa a decimal.
; En este laboratorio se usa N = 4 para obtener 1+2+3+4 = 10 que es dígito"0".
; Usar N = 3 para obtener 1+2+3 = 6 → imprime correctamente "6".


; Procedimiento: comparar AX y BX e imprimir el mayor
; Modifica: AH, DX (los preserva en la pila)
comparar_e_imprimir:
 push ax
 push bx

 cmp ax, bx ; actualiza flags: AX - BX (sin modificar operandos)

 je .son_iguales ; si AX == BX (ZF=1)
 jg .ax_mayor ; si AX > BX con signo (SF=OF, ZF=0)

 ; Caso: BX es mayor
 print_str msg_mayor ; imprimir etiqueta
 mov al, bl ; AL = valor de BX
 print_digito ; imprimir dígito
 nueva_linea
 jmp .fin_comp

.ax_mayor:
 print_str msg_mayor
 print_digito ; AX sigue en AL desde el push (se restauradespués)
 nueva_linea
 jmp .fin_comp

.son_iguales:
 print_str msg_iguales

.fin_comp:
 pop bx
 pop ax
 ret


