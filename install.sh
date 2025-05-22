#!/bin/bash

echo "🔧 Iniciando la instalación del entorno para el sistema P2P..."

# 1. Verificar si Go está instalado
if ! command -v go &> /dev/null; then
    echo "🚫 Go no está instalado. Instalando..."
    sudo apt update
    sudo apt install -y golang
else
    echo "✅ Go ya está instalado."
fi

# 2. Detectar la IP local
IP=$(hostname -I | awk '{print $1}')
echo "🌐 IP detectada: $IP"

# 3. Instalar dependencias del proyecto
echo "📦 Instalando módulos del proyecto..."
go mod tidy

# 4. Mensaje final
echo ""
echo "✅ Todo se ha instalado correctamente."
echo "🌐 Tu IP local es: $IP"
echo ""
echo "📝 Ahora edita el archivo 'config/peers.json' agregando tu máquina de esta forma:"
echo ""
echo "[
    {
        \"id\": 1,
        \"ip\": \"$IP\",
        \"port\": \"8000\",
        \"local\": true
    },
    {
        \"id\": 2,
        \"ip\": \"192.168.0.X\",
        \"port\": \"8000\",
        \"local\": false
    }
]"
echo ""
echo "🚀 Una vez editado, ejecuta el programa con:"
echo "    go run ./cmd"
