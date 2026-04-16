#!/bin/bash

# Script interactiu per crear un usuari i un grup al sistema
# Utilitza la comanda read per demanar dades a l'usuari

clear

# Demanem el nom d'usuari
read -p "Introdueix el nom d'usuari: " NOM

# Demanem el comentari o nom complet
read -p "Introdueix el nom complet o comentari: " COMENTARI

# Demanem el nom del grup
read -p "Introdueix el nom del grup: " GRUP

# Validació: cap camp pot estar buit
if [ -z "$NOM" ] || [ -z "$COMENTARI" ] || [ -z "$GRUP" ]; then
    echo "Error: cap camp pot estar buit."
    exit 1
fi

# Crear el grup si no existeix
if ! getent group "$GRUP" > /dev/null; then
    echo "El grup $GRUP no existeix. Creant-lo..."
    groupadd "$GRUP"
fi

# Crear l'usuari amb el comentari i el grup primari
useradd -c "$COMENTARI" -g "$GRUP" "$NOM"

echo "L'usuari $NOM s'ha creat correctament dins del grup $GRUP."
