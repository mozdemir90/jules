# KidsLearn

## İş Dünyası Genel Bakış (Business Overview)

### Proje Tanımı
KidsLearn, çocukların sayıları eğlenceli ve etkileşimli bir şekilde öğrenmelerine yardımcı olmak için tasarlanmış eğitici bir mobil uygulamadır. Uygulama, öğrenmeyi keyifli hale getirmek için renkli görseller ve net metinler içeren basit, çocuk dostu bir arayüze sahiptir.

### Temel Özellikler
- **Sayıları Öğrenin:** 1'den 10'a kadar interaktif sayı kartları.
- **Görsel Yardımcılar:** Her sayı, öğrenmeyi pekiştirmek için farklı bir renk ve İngilizce kelime karşılığı ile ilişkilendirilmiştir.
- **Temiz Arayüz:** Kolay gezinme ve büyük, okunaklı metinlerle özellikle küçük çocuklar için tasarlanmıştır.

### Hedef Kitle
- Okul öncesi ve anaokulu çocukları (3-6 yaş).
- Çocukları için basit eğitim araçları arayan ebeveynler.

---

## Geliştirme Genel Bakış (Development Overview)

### Teknoloji Yığını
- **Framework:** Flutter
- **Dil:** Dart
- **Durum Yönetimi (State Management):** [Riverpod](https://riverpod.dev/) (`riverpod_annotation` ve `riverpod_generator` kullanılarak)

### Mimari
Proje, kodu katmanlar yerine özelliklere göre organize eden **Feature-first** (Özellik Öncelikli) mimarisini takip eder. Bu yapı modülerliği ve ölçeklenebilirliği artırır.

#### Proje Yapısı
- `lib/src/features`: Özelliğe özgü mantığı içerir.
  - **home**: Ana giriş noktası ve navigasyon.
  - **numbers**: Sayıları öğrenmek için temel özellik.
    - `data`: Veri sağlayıcıları (örn. `NumberRepository`) ve Riverpod sağlayıcıları.
    - `domain`: Veri modelleri (örn. `NumberModel`) ve iş varlıkları.
    - `presentation`: UI widget'ları ve ekranlar (örn. `NumberScreen`).
- `lib/src/common_widgets`: Birden fazla özellik arasında kullanılan yeniden kullanılabilir UI bileşenleri.
- `lib/src/constants`: Temalar ve stiller gibi uygulama genelindeki sabitler.

### Kurulum ve Başlangıç

#### Ön Koşullar
- [Flutter SDK](https://docs.flutter.dev/get-started/install) kurulu olmalıdır.
- Fiziksel bir cihaz veya emülatör/simülatör.

#### Adımlar
1.  **Depoyu klonlayın:**
    ```bash
    git clone <repository-url>
    cd kids_learn
    ```

2.  **Bağımlılıkları yükleyin:**
    ```bash
    flutter pub get
    ```

3.  **Kod Üretimini Çalıştırın:**
    Proje `riverpod_generator` kullandığı için, gerekli kodları üretmek adına build runner'ı çalıştırmanız gerekir.
    ```bash
    dart run build_runner build -d
    ```
    Dosyalar değiştiğinde otomatik olarak yeniden oluşturmak için:
    ```bash
    dart run build_runner watch -d
    ```

4.  **Uygulamayı çalıştırın:**
    ```bash
    flutter run
    ```

### Test
Testleri çalıştırmak için şu komutu kullanın:
```bash
flutter test
```
