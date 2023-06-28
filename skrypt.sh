
#!/bin/bash

if [[ "$1" == "--date" ]]; then
    date
elif [[ "$1" == "--logs" ]]; then
    if [[ -z "$2" ]]; then
        echo "Podaj liczbę plików jako drugi argument."
    else
        for ((i=1; i<=$2; i++)); do
            echo "Nazwa pliku: log$i.txt"
            echo "Nazwa skryptu: skrypt.sh"
            echo "Data: $(date)"
            echo
            echo "Zawartość pliku: " >> "log$i.txt"
            echo "Nazwa pliku: log$i.txt" >> "log$i.txt"
            echo "Nazwa skryptu: skrypt.sh" >> "log$i.txt"
            echo "Data: $(date)" >> "log$i.txt"
        done
        echo "Utworzono $2 plików log."
    fi
elif [[ "$1" == "--help" ]]; then
    echo "Dostępne opcje:"
    echo "--date : Wyświetla dzisiejszą datę."
    echo "--logs [liczba] : Tworzy określoną liczbę plików log i zapisuje w nich informacje."
    echo "--help : Wyświetla wszystkie dostępne opcje."
else
    echo "Nieznana opcja. Użyj --help, aby zobaczyć dostępne opcje."
fi
