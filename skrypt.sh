#!/bin/bash

# Funkcja wyświetlająca pomoc
display_help() {
  echo "Skrypt.sh - Skrypt bash"
  echo "Dostępne opcje:"
  echo "  --help, -h          Wyświetla pomoc"
  echo "  --logs, -l          Tworzy 100 plików logx/logx.txt"
  echo "  --logs N            Tworzy N plików logx/logx.txt"
  echo "  --date, -d          Wyświetla dzisiejszą datę"
  echo "  --init              Klonuje repozytorium i ustawia ścieżkę w PATH"
  echo "  --error, -e N       Tworzy N plików errorx/errorx.txt"
}

# Funkcja tworząca pliki log
create_log_files() {
  local count=$1
  for ((i=1; i<=count; i++))
  do
    echo "Nazwa pliku: log$i.txt" > log$i/log$i.txt
    echo "Nazwa skryptu: skrypt.sh" >> log$i/log$i.txt
    echo "Data: $(date)" >> log$i/log$i.txt
  done
}

# Funkcja tworząca pliki error
create_error_files() {
  local count=$1
  for ((i=1; i<=count; i++))
  do
    echo "Nazwa pliku: error$i.txt" > error$i/error$i.txt
    echo "Nazwa skryptu: skrypt.sh" >> error$i/error$i.txt
    echo "Data: $(date)" >> error$i/error$i.txt
  done
}

# Obsługa flag
while [[ $# -gt 0 ]]
do
  key="$1"

  case $key in
    --help|-h)
      display_help
      exit 0
      ;;
    --logs|-l)
      create_log_files 100
      exit 0
      ;;
    --logs)
      create_log_files "$2"
      exit 0
      ;;
    --date|-d)
      echo $(date)
      exit 0
      ;;
    --init)
      git clone https://github.com/adakde/lab04.git
      export PATH=$PATH:$(pwd)/lab04
      exit 0
      ;;
    --error|-e)
      create_error_files 100
      exit 0
      ;;
    --error|-e)
      create_error_files "$2"
      exit 0
      ;;
    *)
      echo "Nieznana opcja: $key"
      exit 1
      ;;
  esac
  shift
done
