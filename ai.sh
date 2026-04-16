#!/bin/bash

# Script d'instal·lació de paquets utilitzant paràmetres
# L'usuari pot indicar els paquets en executar l'script:
# Exemple: ./ai.sh vim git curl

# Comprovació: s'han passat paràmetres?
if [ $# -eq 0 ]; then
    echo "Error: no s'han indicat paquets."
    echo "Ús: $0 paquet1 paquet2 ..."
    exit 1
fi

# Actualització de repositoris
echo "Actualitzant repositoris..."
apt update

# Actualització de paquets instal·lats
echo "Actualitzant paquets instal·lats..."
apt upgrade -y

# Instal·lació dels paquets rebuts com a paràmetres
echo "Instal·lant paquets: $@"
apt install -y $@

echo "Procés completat correctament."
