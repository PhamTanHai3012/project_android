import 'package:flutter/material.dart';
import 'package:tanhai_63133878/list_provider/app_state.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

//Call PageHome
class AppStore extends StatelessWidget {
  const AppStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: MaterialApp(
          home: FruitStoreHomePage(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}

class FruitStoreHomePage extends StatelessWidget {
  const FruitStoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: badges.Badge(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GioHangPage())
                );
              },
              showBadge: appState.slMH_GioHang > 0,
              badgeContent: Text("${appState.slMH_GioHang}", style: TextStyle(color: Colors.white)),
              child: Icon(Icons.shopping_cart_outlined),
            ),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(appState.dssp[index]),
              trailing: IconButton(
                onPressed: () {
                  AppState readState = context.read<AppState>();
                  readState.them(index);
                },
                icon: appState.mhCoTrongGioHang(index) == false ? Icon(Icons.add) : Icon(Icons.check),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(thickness: 1.5),
          itemCount: appState.dssp.length
      ),
    );
  }
}

class GioHangPage extends StatelessWidget {
  const GioHangPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping Cart"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    int id = appState.gioHang[index];
                    return ListTile(
                      title: Text(appState.dssp[id]),
                      trailing: IconButton(
                        onPressed: () {
                          AppState readState = context.read<AppState>();
                          readState.xoa(index);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(thickness: 1.5),
                  itemCount: appState.gioHang.length
              )
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Tổng số tiền: ", style: TextStyle(fontSize: 20)),
                Text("${appState.slMH_GioHang * 50000} VND", style: TextStyle(fontSize: 30,color: Colors.red, fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}
