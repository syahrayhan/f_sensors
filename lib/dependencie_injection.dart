import 'package:battery_info/battery_info_plugin.dart';
import 'package:flutter_sensor/core/data/datasources/auth_local_datasource.dart';
import 'package:flutter_sensor/core/data/datasources/notes_local_datasource.dart';
import 'package:flutter_sensor/core/data/repositories/auth_repository_impl.dart';
import 'package:flutter_sensor/core/data/repositories/notes_repository_impl.dart';
import 'package:flutter_sensor/core/domain/repositories/auth_repository.dart';
import 'package:flutter_sensor/core/domain/repositories/notes_repository.dart';
import 'package:flutter_sensor/core/domain/usecases/create_note.dart';
import 'package:flutter_sensor/core/domain/usecases/delete_note.dart';
import 'package:flutter_sensor/core/domain/usecases/get_notes.dart';
import 'package:flutter_sensor/core/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_sensor/core/domain/usecases/sign_up_with_email.dart';
import 'package:flutter_sensor/core/domain/usecases/update_note.dart';
import 'package:flutter_sensor/features/battery_info/bloc/battery_info_bloc.dart';
import 'package:flutter_sensor/features/crud_data/bloc/crud_bloc.dart';
import 'package:flutter_sensor/features/location/bloc/location_bloc.dart';
import 'package:flutter_sensor/features/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_sensor/features/sign_up/bloc/sign_up_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/data/datasources/db/database_helper.dart';
import 'features/date_and_time/bloc/date_and_time_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc
  sl.registerFactory(
    () => SignUpBloc(
      signUpWithEmail: sl(),
    ),
  );
  sl.registerFactory(
    () => SignInBloc(
      signInWithEmail: sl(),
    ),
  );
  sl.registerFactory(
    () => DateAndTimeBloc(),
  );
  sl.registerFactory(
    () => BatteryInfoBloc(
      sl(),
    ),
  );
  sl.registerFactory(
    () => LocationBloc(),
  );
  sl.registerFactory(
    () => CrudBloc(
      createNote: sl(),
      updateNote: sl(),
      deleteNote: sl(),
      getNotes: sl(),
    ),
  );

  //! Usecases
  sl.registerLazySingleton(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => CreateNote(sl()));
  sl.registerLazySingleton(() => UpdateNote(sl()));
  sl.registerLazySingleton(() => GetNotes(sl()));
  sl.registerLazySingleton(() => DeleteNote(sl()));

  //! Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<NotesRepository>(() => NotesRepositoryImpl(sl()));

  //! Data sources
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<NotesLocalDatasource>(
    () => NotesLocalDatasourceImpl(sl()),
  );

  //! helper
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //! External
  sl.registerLazySingleton(BatteryInfoPlugin.new);
}
