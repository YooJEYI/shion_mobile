
import 'package:mysql1/mysql1.dart';

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