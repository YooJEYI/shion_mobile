
  import 'package:mysql1/mysql1.dart';
import 'package:zion_shel/mysql.dart';

class NoticeProvider {

    Future<List<dynamic>> getData() async {
      final conn = await MySqlConnection.connect(ConnectionSettings(
        host: Mysql.host,
        port: Mysql.port,
        user: Mysql.user,
        password: Mysql.password,
        db: Mysql.db,
      ));

      var results2 = await conn.query(
          'select * from board');
      for (var row in results2) {
        print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
      }

      return results2.toList();
    }

  }