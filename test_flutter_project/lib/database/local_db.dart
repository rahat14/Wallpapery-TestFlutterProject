import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

// here code will generate it self.
part 'local_db.g.dart';

class LocalPhoto extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get pageNo => integer()();

  TextColumn get link => text()();

  TextColumn get linkSrc => text()();
}

@DriftDatabase(tables: [LocalPhoto])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) {
        return m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        await m.createAll();
      });

  Future<List<LocalPhotoData>> getAllPhotos() => select(localPhoto).get();

  Future deleteAllLocalPhoto() =>
      (delete(localPhoto)..where((t) => t.id.isBiggerThanValue(0))).go();

  Future insertPhotos(List<LocalPhotoData> photos) async {
    await batch((batch) => batch.insertAll(localPhoto, photos , mode:  InsertMode.insertOrReplace )
    );
  }

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'wallpaper_db.sqlite'));
    return NativeDatabase(file);
  });
}
