# Lunify Ajanda

Kalem destekli, yıllık görünümlü, telefon/tablet/web uyumlu dijital ajanda.

## İlk MVP
- Responsive 12 aylık görünüm
- Gün seçimi
- Dokunmatik ekran veya kalemle serbest yazı
- Çizimi temizleme
- AI işlemleri için hazır eylem noktası

## Yol haritası
1. Yerel kalıcı kayıt ve çevrimdışı kullanım
2. E-posta ve Google ile kimlik doğrulama
3. Hesap bazlı bulut senkronizasyonu
4. El yazısı OCR, özet ve görev çıkarma API entegrasyonu
5. Hatırlatıcılar, arama ve dışa aktarma

## Çalıştırma
```bash
flutter pub get
flutter run
```

## Ortamlar
- Staging: `ajanda-test.lunify.world`
- Production: `ajanda.lunify.world`

Sırlar kaynak koda eklenmez. Staging ve production ayrı GitHub Environments ve Secrets kullanır. Production dağıtımı manuel onay ve doğrulanmış yedek gerektirir.
