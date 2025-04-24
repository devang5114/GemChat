import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemchat/core/config/route/app_routes.dart';
import 'package:gemchat/features/chat_bot/business_logic/bloc/chat_bloc.dart';
import 'package:gemchat/features/chat_bot/data/data__provider/firebase_vertax_ai_provider.dart';
import 'package:gemchat/features/chat_bot/data/repository/chat_bot_repository.dart';

import '../../../features/chat_bot/presentation/screens/chat_screen.dart';

class AppRouteManager {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => SizedBox(),
          settings: RouteSettings(name: AppRoutes.splash),
        );
      case AppRoutes.chatScreen:
        return MaterialPageRoute(
          builder:
              (context) => RepositoryProvider(
                create:
                    (context) => ChatBotRepository(
                      FirebaseVertaxAiProvider(FirebaseVertexAI.instance),
                    ),
                child: BlocProvider(
                  create:
                      (context) => ChatBloc(context.read<ChatBotRepository>()),
                  child: ChatScreen(),
                ),
              ),
          settings: RouteSettings(name: AppRoutes.splash),
        );

      default:
        return MaterialPageRoute(
          builder:
              (context) => Scaffold(
                body: Center(
                  child: Text(
                    "404\nScreen Not Found",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          settings: RouteSettings(name: AppRoutes.splash),
        );
    }
  }
}
