#!/bin/sh


TARGET_DIR="${1:-.}"

echo "=== Organizator de Fișiere și Căutător de Duplicate ==="
echo "Folder țintă: $TARGET_DIR"
echo "--------------------------------------------------------"


echo "1. Începem organizarea fișierelor pe categorii..."

for file in "$TARGET_DIR"/*; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")
    ext="${filename##*.}"

    if [ "$filename" = "$ext" ]; then
        folder_dest="Altele"
    else
        ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
        case "$ext" in
            jpg|jpeg|png|gif|svg) folder_dest="Imagini" ;;
            pdf|doc|docx|txt|md)  folder_dest="Documente" ;;
            mp3|wav|flac)         folder_dest="Muzica" ;;
            mp4|mkv|avi)          folder_dest="Video" ;;
            zip|tar|gz|rar)       folder_dest="Arhive" ;;
            sh|py|js|c|cpp|html)  folder_dest="Programare" ;;
            *)                    folder_dest="Altele" ;;
        esac
    fi

    mkdir -p "$TARGET_DIR/$folder_dest"
    mv "$file" "$TARGET_DIR/$folder_dest/"
    echo "  Mutat: $filename -> $folder_dest/"
done

echo "Organizarea s-a terminat cu succes!"
echo "========================================================"
echo "Script finalizat!"
