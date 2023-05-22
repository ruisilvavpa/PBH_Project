import 'package:sqflite/sqflite.dart';

Future<Database> openDatabaseInstance() async {
  // Caminho do arquivo do banco de dados
  String path = await getDatabasesPath();
  String dbPath = '$path/my_database.db';

  // Abre o banco de dados
  Database database = await openDatabase(dbPath, version: 1,
      onCreate: (Database db, int version) async {
    // Código para criar as tabelas do banco de dados, se necessário
    await db.execute(
        'CREATE TABLE IF NOT EXISTS my_table (id INTEGER PRIMARY KEY, name TEXT)');
  });

  return database;
}
