#!/bin/zsh

# Skontrolujte, či boli zadané dva argumenty (zdrojový a cieľový adresár)
if [ "$#" -ne 2 ]; then
    echo "Použitie: $0 <zdrojový_adresár> <cieľový_adresár>"
    exit 1
fi

SOURCE_DIR="$1"
TARGET_DIR="$2"

# Skontrolujte, či zdrojový adresár existuje
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Chyba: Zdrojový adresár '$SOURCE_DIR' neexistuje."
    exit 1
fi

# Skontrolujte, či cieľový adresár existuje, ak nie, vytvorte ho
if [ ! -d "$TARGET_DIR" ]; then
    echo "Cieľový adresár '$TARGET_DIR' neexistuje, vytváram ho."
    mkdir -p "$TARGET_DIR"
    if [ "$?" -ne 0 ]; then
        echo "Chyba: Nepodarilo sa vytvoriť cieľový adresár '$TARGET_DIR'."
        exit 1
    fi
fi

# Prejdite cez všetky súbory v zdrojovom adresári a vytvorte symlinky
find "$SOURCE_DIR" -maxdepth 1 -type f -print0 | while IFS= read -r -d $'\0' file; do
    FILENAME=$(basename "$file")
    SYMLINK_PATH="$TARGET_DIR/$FILENAME"

    # Vytvorte symlink
    ln -s "$file" "$SYMLINK_PATH"
    if [ "$?" -ne 0 ]; then
        echo "Upozornenie: Nepodarilo sa vytvoriť symlink pre súbor '$file'."
    else
        echo "Vytvorený symlink: '$SYMLINK_PATH' -> '$file'"
    fi
done

echo "Dokončené."
