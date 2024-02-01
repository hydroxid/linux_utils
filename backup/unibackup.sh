#!/bin/bash
#
# jednoduche zalohovani pomoci rsync
#
# unibackup_list.txt - zde jsou uvedeny cesty, ktere se maji zalohovat - co radek, to cesta
#
###############################################################################

# co chceme zalohovat
file_list='unibackup_include_list.txt'

# co se nema zalohovat
exclude_list='unibackup_exclude_list.txt'

# logovaci soubor
log='unibackup.log'

# kam se bude zalohovat
target_path='unibackups/'

# pokud cilovy adresar neexistuje, tak ho vytvorime
[ -d "$target_path" ] || mkdir "$target_path"

# kontrola, zda file_list existuje
if [ -e "$file_list" ]; then

  # iterace přes jednotlivé řádky
  while IFS= read -r src_path; do

    echo "Procesing: $src_path"

    # cilovy adresar = vnoreny adresar
    full_target_path="${target_path}${src_path}"

    # adresar neexistuje, vytvorime ho
    if ! [ -d "${full_target_path}" ]; then
       mkdir -p "$full_target_path"
    fi

    # spustime rsync
    rsync -av --exclude-from=${exclude_list} "${src_path}" "${full_target_path}"  --progress --delete

    # ziskani aktualniha data a casu
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    # vytvoreni log zpravy
    log_message="${timestamp} - ${src_path}"

    # zapis do logovaciho souboru
    echo "$log_message" >> "$log"

  done < "$file_list"

else
  echo "Soubor $file_list neexistuje."

fi
