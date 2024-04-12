import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/config/theme/app_theme.dart';
import 'package:tik_tok_clone/presentation/providers/discover_provider.dart';

import 'presentation/pages/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Por defecto el comportamiento natural de los ChangeNotifierProvider
        //es que hasta que no es necesario no se crea el DiscoverProvider, de manera
        //que se carga de manera perezosa.
        //Por lo tanto si lo necesitamos ya mismo, quitas la carga perezosa
        ChangeNotifierProvider(
          lazy: false,
            create: (_) => DiscoverProvider()..loadVideos())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen()
      ),
    );
  }
}