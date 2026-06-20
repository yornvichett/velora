import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velora/Factory/profider_factory.dart';
import 'package:velora/Helper/go_page/go_page.dart';
import 'package:velora/MVC/Model/auth_local_model.dart';
import 'package:velora/MVC/Model/login_model.dart';
import 'package:velora/MVC/View/Auth/auth_login_view.dart';
import 'package:velora/MVC/View/Home/home_view.dart';
import 'package:velora/Repository/State/auth_local_state.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      var controller = ref.read(authLocalFactory.notifier);
      controller.initAuthLocal();
    });
  }

  @override
  Widget build(BuildContext context) {
    var model = ref.watch(authLocalFactory);
    print("model.accessToken=====> ${model.accessToken}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: model.authLocalState == AuthLocalState.success
          ? model.accessToken != null
                ? HomeView()
                : AuthLoginView()
          : AuthLoginView(),
    );
  }
}
