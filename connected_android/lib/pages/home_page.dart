import 'package:connected_android/widgets/drawer/user_menu.dart';
import 'package:connected_android/widgets/product_list.dart';
import 'package:connected_android/widgets/search/products/searchbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/search/stores/searchbar.dart';
import '../widgets/shop_list.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage ({ Key? key, required this.user }): super(key: key);

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
                icon: Icon(Icons.discount_outlined),
                text: 'Hot Deals',
              ),
              Tab(
                icon: Icon(Icons.store_outlined),
                text: 'Tiendas',
              )
            ],
          ),
        ),
        drawer: UserMenu(user: widget.user),
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
