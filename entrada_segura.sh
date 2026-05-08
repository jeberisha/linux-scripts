#!/bin/bash
# Script: entrada_segura.sh
# Objectiu: Validar una ruta amb un bucle UNTIL i fer un compte enrere amb WHILE.

clear

# --- BUCLE UNTIL: demanar una ruta fins que sigui vàlida ---
# El bucle continua MENTRE la condició sigui falsa.
# Pararà quan: [ -e "$ruta" ] sigui CERT (la ruta existeix).

until [ -e "$ruta" ]; do
    read -p "Introdueix una ruta vàlida o escriu 'sortir': " ruta

    # Opció de sortida immediata
    if [ "$ruta" = "sortir" ]; then
        echo "Sortint de l'script..."
        exit 0
    fi

    # Si la ruta no existeix → error
    if [ ! -e "$ruta" ]; then
        echo "La ruta no és vàlida, torna-ho a intentar."
    fi
done

echo "Ruta correcta detectada: $ruta"
echo ""

# --- BUCLE WHILE: compte enrere ---
# Demanem un número i validem que sigui numèric.

read -p "Introdueix un número per iniciar el compte enrere: " num

# Validació numèrica
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: Has d'introduir un valor numèric."
    exit 1
fi

echo "Iniciant compte enrere..."
echo ""

# WHILE: s'executa mentre la condició és CERT
# Pararà quan num arribi a 0

while [ "$num" -ge 0 ]; do
    echo "Processant l'element en $num segons..."
    sleep 1
    num=$((num - 1))
done

echo "Procés finalitzat correctament!"

