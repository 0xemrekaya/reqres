import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reqres/screens/home/controller/home_controller.dart';

import '../../../core/core.dart';
import '../../login/login.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});
  static const String id = 'home_view';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  List userList = [];
  final String title = "Home Page";

  @override
  Widget build(BuildContext context) {
    ref.read(homeControllerProvider).getUserList();
    userList = ref.watch(homeControllerProvider).listUserModel;
    final watch = ref.watch(homeControllerProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title)),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(authManagerProvider).logoutUser();
              Navigator.pushNamedAndRemoveUntil(context, LoginView.id, (route) => false);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: height / 1.2,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(5.0),
                      elevation : 3.0,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10.0),
                        leading: watch.listUserModel[index].avatar != null
                            ? ClipRRect(borderRadius: BorderRadius.circular(10.0),child: Image.network(watch.listUserModel[index].avatar!, width: width/5, fit: BoxFit.fitWidth,))
                            : const Icon(Icons.person),
                        title: Text(watch.listUserModel[index].firstName ?? ''),
                      ),
                    );
                  },
                  itemCount: watch.listUserModel.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
