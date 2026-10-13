import 'package:flutter/material.dart';

void main() {
  runApp(const IsciTakipApp());
}

class IsciTakipApp extends StatelessWidget {
  const IsciTakipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'İşçi Takip ve Maaş',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IsciListesiSayfasi(),
    );
  }
}

// İşçi Model Sınıfı
class Isci {
  String ad;
  double gunlukUcret;
  int calisilanGun;
  int izinliGun;

  Isci({required this.ad, required this.gunlukUcret, this.calisilanGun = 30, this.izinliGun = 0});

  double get toplamMaas => calisilanGun * gunlukUcret;
}

class IsciListesiSayfasi extends StatefulWidget {
  const IsciListesiSayfasi({super.key});

  @override
  State<IsciListesiSayfasi> createState() => _IsciListesiSayfasiState();
}

class _IsciListesiSayfasiState extends State<IsciListesiSayfasi> {
  final List<Isci> _isciler = [
    Isci(ad: 'Muhammed Kılıç', gunlukUcret: 500),
    
  ];

  void _yeniIsciEkle(String ad, double gunlukUcret) {
    setState(() {
      _isciler.add(Isci(ad: ad, gunlukUcret: gunlukUcret));
    });
  }

  void _izinDus(Isci isci) {
    setState(() {
      if (isci.calisilanGun > 0) {
        isci.calisilanGun -= 1;
        isci.izinliGun += 1;
      }
    });
  }

  void _dialogGoster() {
    final adController = TextEditingController();
    final ucretController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Yeni İşçi Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: adController,
                decoration: const InputDecoration(labelText: 'İşçi Ad Soyad'),
              ),
              TextField(
                controller: ucretController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Günlük Ücret (TL)'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
            ElevatedButton(
              onPressed: () {
                if (adController.text.isNotEmpty && ucretController.text.isNotEmpty) {
                  _yeniIsciEkle(adController.text, double.tryParse(ucretController.text) ?? 0);
                  Navigator.pop(context);
                }
              },
              child: const Text('Ekle'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('İşçi Takip ve Maaş Otomasyonu')),
      body: ListView.builder(
        itemCount: _isciler.length,
        itemBuilder: (context, index) {
          final isci = _isciler[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: ListTile(
              title: Text(isci.ad, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Günlük: ${isci.gunlukUcret} TL\n'
                'Çalışılan: ${isci.calisilanGun} Gün | İzinli: ${isci.izinliGun} Gün\n'
                'Toplam Maaş: ${isci.toplamMaas} TL',
              ),
              isThreeLine: true,
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => _izinDus(isci),
                child: const Text('1 Gün İzin Yaz', style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: _dialogGoster, child: const Icon(Icons.add)),
    );
  }
}
