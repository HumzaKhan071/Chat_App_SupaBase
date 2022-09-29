import 'package:chat_app/api_service.dart';
import 'package:chat_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;

import 'chat_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ijvmvoudzzfjrivkxzhw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imlqdm12b3VkenpmanJpdmt4emh3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjQzODU4NzcsImV4cCI6MTk3OTk2MTg3N30.CE7dZeFnpUfI0MjSnPXujzeDynW3vGgVGdfCvotRxvs',
  );
  runApp(provider.MultiProvider(
    providers: [
      provider.ChangeNotifierProvider<AppService>(
        create: (_) => AppService(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      routes: {"/chat":(context) => const ChatPage()},
    );
  }
}
