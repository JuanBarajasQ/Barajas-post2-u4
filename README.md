# Barajas-post2-u4
## Descripción
Laboratorio 2 de la Unidad 4: Programa NASM con macros con parámetros y control de flujo. 

## Objetivo
<div align="justify">
Implementar un programa en lenguaje ensamblador NASM que define
y utiliza macros con parámetros y etiquetas locales, aplicando estructuras de control
de flujo (bucles con LOOP y condicionales con CMP/Jcc) para resolver un
problema de lógica programática, y combinando estos mecanismos en un programa
integrador funcional y documentado, verificable en DOSBox.
</div>

## Prerrequisitos
- DOSBox 0.74+
- NASM 2.14+
- ALINK
## Compilación y ejecución
<div align="justify">
Se debe ejecutar en la consola de Windows los siguientes comandos, ubicandose previamente en la carpeta donde se ha clonado el repositorio: <br><br>


nasm -f obj programa2.asm -o programa2.obj -l programa2.lst <br>
alink programa2.obj -oEXE -o program2.exe -entry main

Una vez realizado esto, se procede a abrir DOSBox y montar como unidad C a la carpeta en donde fue clonado el repositorio. Posterior a esto, se ejecuta el código usando "program2.exe" dentro del emulador.<br>

### Nota:
Se nombra el .exe como "program2.exe" en vez de "programa2".exe debido a la restricción de DOSBox de solo permitir nombres de archivos de máximo 8 carácteres.
</div>
