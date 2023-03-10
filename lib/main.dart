import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/features/home/presentation/views/notes_view.dart';

import 'package:sizer/sizer.dart';

import 'features/home/data/models/note_model.dart';
import 'features/home/presentation/manager/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NotesCubit()),
            //BlocProvider(create: (context) => AddNoteCubit())
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Poppins',
              brightness: Brightness.dark,
              /*textTheme: const TextTheme(
                          headlineMedium: TextStyle(color: Colors.white),
                          titleLarge: TextStyle(color: Colors.black54, fontSize: 18),
                          titleMedium: TextStyle(color: Colors.black54, fontSize: 15),
                        ),*/
            ),
            debugShowCheckedModeBanner: false,
            home: const NotesView(),
          ),
        );
      },
    );
  }
}
