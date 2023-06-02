import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:note_app/features/data/datasources/firebase_remote_source.dart';
import 'package:note_app/features/data/datasources/firebase_remote_source_impl.dart';
import 'package:note_app/features/data/repositories/firebase_repositories_impl.dart';
import 'package:note_app/features/domain/repositories/firebase_repositories.dart';
import 'package:note_app/features/domain/usecases/firebase_usecases.dart';
import 'package:note_app/features/presentation/controller/auth_controller.dart';
import 'package:note_app/services/local_database_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;
Future<void> initialize() async {
  sl.registerFactory<AuthController>(
    () => AuthController(useCases: sl.call(), databaseService: sl.call()),
  );

  // usecases
  sl.registerLazySingleton<FireBaseUseCases>(
      () => FireBaseUseCases(repository: sl.call()));

  // repositories
  sl.registerLazySingleton<FireBaseRepository>(
      () => FireBaseRepositoryImpl(datasource: sl.call()));

  // data sources
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
    () => FirebaseRemoteDataSourceImpl(
      auth: sl.call(),
      firestore: sl.call(),
    ),
  );

  // services
  sl.registerLazySingleton(() => DatabaseService(sl.call()));

  // Externals

  final fireBaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  final preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => fireBaseAuth);
  sl.registerLazySingleton(() => firebaseFirestore);
}
