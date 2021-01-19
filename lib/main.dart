import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';
import 'package:proyectofinal/todo/principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PrincipalCubit(),
      child: MaterialApp(
        title: 'Números Maya',
        home: Inicio(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  const Inicio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Números Maya'),
            backgroundColor: Colors.blue,
          ),
          body: Container(
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Números Maya',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 50),
                ),
                SizedBox(height: 40),
                Boton('Arábigo a Maya', 1),
                SizedBox(height: 20),
                Boton('Maya a Arábigo', 0),
                SizedBox(height: 20),
                Boton('Random', 2),
              ],
            )),
          ),
        );
      },
    );
  }
}

class Boton extends StatelessWidget {
  final String texto;
  final int tipo;
  const Boton(this.texto, this.tipo);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        return FlatButton(
          child: Text(
            texto,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 50),
          ),
          onPressed: () {
            context.read<PrincipalCubit>().numeroAleatorio(tipo);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Principal()),
            );
          },
        );
      },
    );
  }
}
