# KidsLearn

[🇬🇧 Read in English (İngilizce Oku)](README.md)

**KidsLearn** deposuna hoş geldiniz! Bu, küçük çocukların görsel ve işitsel geri bildirimler aracılığıyla temel kavramları öğrenmelerine yardımcı olmak için tasarlanmış etkileşimli bir eğitim uygulamasıdır.

---

## 📚 İş Özeti (Business Overview)

### Proje Tanımı
KidsLearn, okul öncesi ve ilkokul çağı çocukları için öğrenmeyi eğlenceli ve erişilebilir hale getirmeyi amaçlayan, Flutter ile geliştirilmiş bir mobil uygulamadır. Uygulama, sayı tanıma ve telaffuz ile başlayarak etkileşimli öğrenme deneyimlerine odaklanmaktadır.

### Temel Özellikler
*   **Sayıları Öğrenme:** Sayıları öğrenmek için özel bir modül.
*   **Sesli Telaffuz:** İşitsel öğrenmeyi pekiştirmek için herhangi bir sayıya dokunarak telaffuzunu dinleyebilirsiniz.
*   **Görsel İlişkilendirme:** Her sayı, renkli görseller ve kelime temsilleri (örneğin, "Bir", "İki") ile birlikte sunulur.
*   **Etkileşimli Arayüz:** Çocuklar için uygun, büyük düğmeler ve canlı renklerle tasarlanmıştır.

### Hedef Kitle
*   Okul öncesi çocuklar (3-5 yaş)
*   Erken ilkokul öğrencileri (6-7 yaş)
*   Eğitici araçlar arayan ebeveynler ve eğitimciler.

---

## 🛠️ Geliştirme Kılavuzu (Development Guide)

### Teknoloji Yığını
*   **Framework:** [Flutter](https://flutter.dev/) (Dart)
*   **Durum Yönetimi (State Management):** [Riverpod](https://riverpod.dev/) (`flutter_riverpod`, `riverpod_annotation`)
*   **Ses:** [AudioPlayers](https://pub.dev/packages/audioplayers)
*   **Kod Üretimi:** `build_runner`, `riverpod_generator`

### Mimari
Proje, ölçeklenebilirlik ve sürdürülebilirlik sağlamak için **Özellik Tabanlı Mimariyi (Feature-First Architecture)** takip eder.

*   `lib/src/features/`: Özelliğe özgü kodları içerir (örneğin, `numbers`, `home`).
    *   Her özellik `data`, `domain` ve `presentation` katmanlarına ayrılmıştır.
*   `lib/src/common_widgets/`: Yeniden kullanılabilir kullanıcı arayüzü bileşenleri.
*   `lib/src/constants/`: Uygulama genelindeki sabitler ve tema yapılandırmaları.

### Klasör Yapısı
```
lib/
├── main.dart                # Uygulama giriş noktası
└── src/
    ├── common_widgets/      # Paylaşılan widget'lar (düğmeler, kartlar vb.)
    ├── constants/           # Tema, renkler, metinler
    └── features/            # Özellik modülleri
        ├── home/            # Ana ekran özelliği
        └── numbers/         # Sayıları Öğren özelliği
            ├── data/        # Veri sağlayıcıları (Riverpod)
            ├── domain/      # Veri modelleri
            └── presentation/# Kullanıcı arayüzü ekranları ve widget'ları
```

### Kurulum ve Yükleme

1.  **Ön Koşullar:** Flutter SDK'sının yüklü olduğundan emin olun.
2.  **Depoyu Klonlayın:**
    ```bash
    git clone <repository-url>
    cd kids_learn
    ```
3.  **Bağımlılıkları Yükleyin:**
    ```bash
    flutter pub get
    ```

### Kod Üretimi
Bu proje, durum yönetimi sağlayıcıları için `riverpod_generator` kullanır. Gerekli kodları (örneğin, `.g.dart` dosyaları) oluşturmak için build runner'ı çalıştırmalısınız.

*   **Tek seferlik derleme:**
    ```bash
    dart run build_runner build
    ```
*   **İzleme modu (geliştirme için):**
    ```bash
    dart run build_runner watch
    ```

### Varlıklar (Assets)
Uygulama, resimler ve sesler için yerel varlıkları kullanır. Proje kök dizininde aşağıdaki yapının mevcut olduğundan emin olun:
*   `assets/audio/numbers/` (örneğin, `1.mp3`, `2.mp3`)
*   `assets/images/numbers/` (örneğin, `1.png`, `2.png`)

### Uygulamayı Çalıştırma
Bir cihaz bağlayın veya emülatör başlatın, ardından şu komutu çalıştırın:
```bash
flutter run
```
