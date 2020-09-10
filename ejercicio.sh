#!/bin/bash

#Este script parsea un JSON y redirecciona los valores solicitados a un archivo.
read -r -p "Ingrese sus SELLER ID separados por espacio: " -a SELLER_ID
for seller in "${SELLER_ID[@]}"; do 
   echo "$seller"
done

for seller in "${SELLER_ID[@]}"; do 
curl -X GET "https://api.mercadolibre.com/sites/MLA/search?seller_id=${seller}" | tac | tac | 
jq ' [ .results | map(.) | .[] | {item_title: .title, item_id: .id, category_id: .category_id, category_name: .domain_id}]'  >> log.txt
done

echo "La ejecución ha finalizado"

