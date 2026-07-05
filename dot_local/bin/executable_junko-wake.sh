#!/usr/bin/env bash
# ~/.local/bin/wake_junko.sh — Réveille junko en WoL (local ou distant)

MAC="30:9C:23:81:DC:BB"
LOCAL_IP="192.168.1.170"
PUBLIC_IP="82.67.218.32"
TS_IP="100.80.80.2"
PORT=9
TIMEOUT=60

# Détecte si on est sur le même réseau local que junko
# en vérifiant si l'IP locale de junko est joignable en moins de 1s
if ping -c1 -W1 "$LOCAL_IP" &>/dev/null 2>&1 || \
   ip route | grep -q "192.168.1.0"; then
    echo "📡 Réseau local détecté → envoi WoL en broadcast local"
    TARGET="$LOCAL_IP"
    wol -i 255.255.255.255 -p "$PORT" "$MAC"
else
    echo "🌍 Réseau externe détecté → envoi WoL via IP publique"
    TARGET="$TS_IP"
    wol -i "$PUBLIC_IP" -p "$PORT" "$MAC"
fi

# Attente que junko réponde (via Tailscale si externe)
echo "⏳ En attente du réveil de junko..."
for i in $(seq 1 $TIMEOUT); do
    if ping -c1 -W1 "$TARGET" &>/dev/null 2>&1; then
        echo "✅ junko est réveillé ! ($i secondes)"
        exit 0
    fi
    sleep 1
done

echo "❌ junko ne répond pas après ${TIMEOUT}s — vérifie le WoL dans le BIOS"
exit 1
