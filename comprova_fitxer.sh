#!/bin/bash

# Neteja de pantalla
clear

# Petició de la ruta
read -p "Introdueix la ruta d'un fitxer o directori: " RUTA

# Validació d'entrada buida
if [ -z "$RUTA" ]; then
    echo "No has introduït cap ruta"
    exit 1
fi

# Comprovació d'existència
if [ -e "$RUTA" ]; then
    echo "L'element $RUTA existeix"

    # Comprovació si és fitxer
    if [ -f "$RUTA" ]; then
        echo "És un fitxer"
    fi

    # Comprovació si és directori
    if [ -d "$RUTA" ]; then
        echo "És un directori"
    fi

    # Comprovació de permisos de lectura
    if [ -r "$RUTA" ]; then
        echo "Tens permisos per llegir aquest element"
    else
        echo "No tens permís de lectura"
    fi

else
    echo "Error: La ruta $RUTA no es troba en el sistema"
fi
