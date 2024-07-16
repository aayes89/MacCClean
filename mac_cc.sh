#!/bin/bash

# Función para mostrar los 10 directorios con más espacio ocupado
mostrar_directorios_espacio() {
    echo "### Directorios con más espacio ocupado ###"
    du -h / | sort -rh | head -n 10
}

# Función para vaciar un directorio seleccionado
vaciar_directorio() {
    echo "Ingrese el directorio que desea vaciar (ej. /ruta/al/directorio):"
    read directorio

    if [ -d "$directorio" ]; then
        echo "Vaciar el contenido de $directorio ..."
        sudo rm -rf "$directorio"/*
        echo "¡Directorio vaciado!"
    else
        echo "El directorio especificado no existe."
    fi
}

# Función para limpiar la caché del sistema Mac
limpiar_cache_mac() {
    echo "Limpiando la caché del sistema Mac ..."
    sudo purge
    echo "Caché limpiada."
}

# Menú principal
echo "### Menú de administración ###"
echo "1. Mostrar los 10 directorios con más espacio ocupado"
echo "2. Vaciar un directorio"
echo "3. Limpiar la caché del sistema Mac"
echo "4. Salir"

read opcion

case $opcion in
    1)
        mostrar_directorios_espacio
        ;;
    2)
        vaciar_directorio
        ;;
    3)
        limpiar_cache_mac
        ;;
    4)
        echo "Saliendo del script."
        exit 0
        ;;
    *)
        echo "Opción no válida."
        ;;
esac

exit 0
