// import 'dart:io';

// void restartServer() async {
//   // Obtén la información de proceso actual
//   final currentProcess =
//       await Process.run('ps', ['-p', Process.pid.toString(), '-o', 'rss']);

//   // Obtén el ID de proceso actual
//   final pid = ProcessInfo.current.pid;

//   // Cierra el proceso actual
//   await Process.run('kill', ['-9', pid.toString()]);

//   // Ejecuta el archivo bin/main.dart de nuevo
//   await Process.run('dart', ['bin/main.dart']);
// }
