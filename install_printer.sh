#!/bin/bash

# Mettre à jour et installer les dépendances nécessaires
apt-get update && apt-get install -y git wget lpr cups

# Télécharger le package d'installation depuis GitHub
cd /scripts
git clone https://github.com/yourusername/yourrepository.git

# Décompresser le package et installer le pilote
cd yourrepository
chmod +x linux-brprinter-installer-2.2.4-1
./linux-brprinter-installer-2.2.4-1 HL-3040CN 192.168.7.100 --silent

# Ajouter l'imprimante à CUPS
lpadmin -p HL-3040CN -E -v socket://192.168.7.100:9100 -m brother_ql_3040.ppd

# Redémarrer CUPS
systemctl restart cups
