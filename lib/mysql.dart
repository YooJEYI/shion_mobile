
import 'package:mysql1/mysql1.dart';
import 'dart:async';
class Mysql {
  static String host = 'localhost:3306',
                user = 'wpdl7899',
                password = 'dkdla7899',
                db = 'wpdl7899';
  static int port = 8082;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
      host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }

}

Future main() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'wpdl7899',
      db: 'testdb',
      password: 'dkdla7899'));

  var results = await conn.query('select * from users');

  print(results.length);
  for (var row in results) {
    print('id: ${row[0]}, email: ${row[1]}');
  }

  // Finally, close the connection
  await conn.close();
}