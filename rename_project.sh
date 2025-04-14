#!/bin/bash

# 🔃 Eski nomlar
OLD_CAP="Bitcoin"
OLD_LOW="bitcoin"
OLD_UP="BITCOIN"
OLD_TICKER="BTC"
OLD_LOW_TICKER="btc"
OLD_CORE="Bitcoin Core"
OLD_DAEMON="bitcoind"
OLD_QT="bitcoin-qt"
OLD_CLI="bitcoin-cli"

# 🔄 Yangi nomlar
NEW_CAP="Halif"
NEW_LOW="halif"
NEW_UP="HALIF"
NEW_TICKER="HLF"
NEW_LOW_TICKER="hlf"
NEW_CORE="Halif Core"
NEW_DAEMON="halifd"
NEW_QT="halif-qt"
NEW_CLI="halif-cli"

echo "🔁 To'liq rebranding boshlanmoqda..."

# 🔍 Fayllarni topib, ichidagi matnlarni almashtirish
find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.md" -o -name "*.ac" -o -name "*.am" -o -name "*.sh" -o -name "*.in" -o -name "*.txt" -o -name "*.po" -o -name "*.py" \) -print0 |
while IFS= read -r -d '' file; do
    echo "✏️  Tahrirlanmoqda: $file"
    sed -i "s/$OLD_CORE/$NEW_CORE/g" "$file"
    sed -i "s/$OLD_CAP/$NEW_CAP/g" "$file"
    sed -i "s/$OLD_LOW/$NEW_LOW/g" "$file"
    sed -i "s/$OLD_UP/$NEW_UP/g" "$file"
    sed -i "s/$OLD_TICKER/$NEW_TICKER/g" "$file"
    sed -i "s/$OLD_LOW_TICKER/$NEW_LOW_TICKER/g" "$file"
    sed -i "s/$OLD_DAEMON/$NEW_DAEMON/g" "$file"
    sed -i "s/$OLD_QT/$NEW_QT/g" "$file"
    sed -i "s/$OLD_CLI/$NEW_CLI/g" "$file"
done

# 📁 Fayl va papka nomlarini ham almashtirish
echo "📁 Papkalar va fayl nomlari yangilanmoqda..."
find . -depth -name "*$OLD_LOW*" | while read name; do
    new_name=$(echo $name | sed "s/$OLD_LOW/$NEW_LOW/g")
    mv "$name" "$new_name"
done

echo "✅ To‘liq rebranding yakunlandi. Endi build qilishga tayyor!"
