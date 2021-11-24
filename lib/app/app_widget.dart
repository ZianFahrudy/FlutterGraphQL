import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:learn_graphql/app/core/network/graphql_config.dart';
import 'package:learn_graphql/app/presentation/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = GraphQLConfig.graphInit();

    return GraphQLProvider(
      client: client,
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
