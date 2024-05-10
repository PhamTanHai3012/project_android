import 'package:get/get.dart';
import 'models.dart';

class SimpleControllerSP extends GetxController{
  List<Fruit> _dssp = [];
  List<Fruit> get dssp => _dssp;

  List<GH_Item> _gioHang = [];
  List<GH_Item> get gioHang => _gioHang;

  int get slMHGH => _gioHang.length;

  static SimpleControllerSP get controller => Get.find<SimpleControllerSP>();

  void themVaoGH(Fruit sp, {List<String>? updateWidgetIds}){
    for(GH_Item item in gioHang)
      if(item.idSP == sp.id){
        item.sl++;
        return;
      }
    gioHang.add(GH_Item(idSP: sp.id, sl: 1));
    update(updateWidgetIds);
  }

  @override
  void onInit() {
    _dssp = AppData().dssp;
    update(["listSP"]);
  }
}

class FruitStoreBindings extends Bindings{

  @override
  void dependencies() {
    Get.put(SimpleControllerSP());
  }
}