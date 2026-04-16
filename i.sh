#!/bin/bash
# Script d'actualització i instal·lació de paquets
# Definim els paquets a instal·lar
PAQUETS="vim git curl"

# Actualització de la llista de paquets
apt update

# Actualització dels paquets instal·lats
apt upgrade -y

# Instal·lació dels paquets definits
apt install -y $PAQUETS

