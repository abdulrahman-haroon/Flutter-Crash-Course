import 'package:clean_arch/config/routes/routes.dart';
import 'package:clean_arch/config/theme/app_themes.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:clean_arch/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:clean_arch/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: DailyNews(),
      ),
    );
  }
}
