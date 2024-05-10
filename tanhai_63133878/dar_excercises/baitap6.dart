import 'dart:math';
Future<int> lateNum() async{
  var one = Duration(seconds: 1);
  return Future.delayed(one).then(
      (value) => Random().nextInt(100),
  );
}
Future<int> lateNum1() async{
  int num = await Future.delayed(
      Duration(
        seconds: 3,
      ),
      () => Random().nextInt(100),
  );
  return num;
}
void main() async{
  //Cach 1
  print("Đợi....");
  int num = await lateNum1();
  print(num);
  //Cach 2
  print("Đợi thêm..");
  lateNum1().then((value) => print(value));
  print("Tạm biệt");
}