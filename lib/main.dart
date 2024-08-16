import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'core/network/network_info.dart';
import 'data/datasources/food_remote_data_source.dart';
import 'data/datasources/food_remote_data_source_impl.dart';
import 'data/repositories/food_repository_impl.dart';
import 'presentation/bloc/food_bloc/food_bloc.dart';
import 'presentation/pages/food_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodBloc(
            repository: FoodRepositoryImpl(
              remoteDataSource: FoodRemoteDataSourceImpl(client: Dio()),
              networkInfo: NetworkInfoImpl(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Food Data App',
        home: FoodPage(foodId: 174819),
      ),
    );
  }
}
