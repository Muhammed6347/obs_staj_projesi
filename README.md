# Öğrenci Bilgi Sistemi (OBS) - Flutter Staj Projesi

Staj döneminde Flutter ve Dart kullanılarak geliştirilen Öğrenci Bilgi Sistemi (OBS) mobil uygulaması ve teknik çalışma kodlarıdır.

## Öne Çıkan Özellikler

* SQLite Veritabanı: users, courses ve grades tabloları ile ilişkisel veri yönetimi[cite: 28].
* Rol Tabanlı Erişim: Admin, akademisyen ve öğrenci yetkilendirmeleri[cite: 28].
* Not ve Harf Hesabı: Akademisyen not girişi; Vize (%40) ve Final (%60) ortalamasına göre otomatik harf notu hesaplama[cite: 29].
* Mimari ve State Management: Provider, MobX ve Bloc kullanımı[cite: 21, 23, 25].
* Ağ ve Servis Katmanı: Dio ve Vexana kütüphaneleri ile REST API entegrasyonu[cite: 14, 24].
* Yerel Veri (Cache): SharedPreferences ile veri önbellekleme[cite: 18].
* Test ve Performans: Mockito birim testleri, Lottie animasyonları ve compute kullanımı[cite: 22, 24, 26].

## Kurulum ve Çalıştırma

git clone https://github.com/kullaniciadi/staj-projesi.git
cd staj-projesi
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

Geliştirici: Muhammed Kılıç  
Kurum: Kırşehir Ahi Evran Üniversitesi - Bilgisayar Mühendisliği  
Birim: Mobil Uygulama Geliştirme Departmanı  
Birim Sorumlusu: Yusuf Ali Bekçi[cite: 1]
