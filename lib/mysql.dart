
import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = 'localhost',
                user = 'root',
                password = 'dkdla7899',
                db = 'company';
  static int port = 3306;


  Future<MySqlConnection> getConnection()async {
    var settings = new ConnectionSettings(
      host: host,
      port: port,
      user: user,
      password: password,
      db: db
    );
    return await MySqlConnection.connect(settings);
  }


}