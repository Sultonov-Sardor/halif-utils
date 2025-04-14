#!/bin/bash

# Eski nomlar
OLD1="Bitcoin"
OLD2="bitcoin"
OLD3="BTC"

# Yangi nomlar (bularni istasang o'zgartir)
NEW1="Halif"
NEW2="halif"
NEW3="HLF"

echo "🔁 Rebranding boshlanmoqda..."

# Fayllarni topib, ichidagi nomlarni avtomatik almashtirish
find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.md" -o -name "*.ac" -o -name "*.am" -o -name "*.sh" -o -name "*.in" -o -name "*.txt" \) -print0 |
while IFS= read -r -d '' file; do
    echo "✏️  Tahrirlanmoqda: $file"
    sed -i "s/$OLD1/$NEW1/g" "$file"
    sed -i "s/$OLD2/$NEW2/g" "$file"
    sed -i "s/$OLD3/$NEW3/g" "$file"
done

# Folder nomlari ichida ham o'zgartirish
echo "📁 Fayl va papka nomlari ham yangilanmoqda..."
find . -depth -name "*$OLD2*" | while read name; do
    new_name=$(echo $name | sed "s/$OLD2/$NEW2/g")
    mv "$name" "$new_name"
done

echo "✅ Rebranding to‘liq yakunlandi. Endi build qilishga tayyor!"
