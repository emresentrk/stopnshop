import 'package:stopnshop/dtb/Urunler.dart';

import 'VeritabaniYrd.dart';

class Urunlerdao {
  Future<List<Urunler>> tumUrunler() async {
    var db = await VeritabaniYrd.vtErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM urunler");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Urunler(
          satir["urun_id"], satir["resim"], satir["urun_ismi"], satir["fiyat"]);
    });
  }
}
