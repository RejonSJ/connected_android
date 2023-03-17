import 'package:connected_android/widgets/product_list.dart';
import 'package:connected_android/widgets/search/products/searchbar.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer/default_drawer.dart';
import '../widgets/search/stores/searchbar.dart';
import '../widgets/shop_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Connected'),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(
                icon: Icon(Icons.bento_outlined),
                text: 'Productos',
              ),
              Tab(
                icon: Icon(Icons.store_outlined),
                text: 'Tiendas',
              )
            ],
          ),
        ),
        //drawer: DefaultDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Stack(children: const [
              ProductList(),
              ProductSearchBar(),
            ]),
            Stack(children: const [
              ShopList(),
              StoreSearchBar(),
            ]),
          ],
        ),
      ),
    );
  }
}
