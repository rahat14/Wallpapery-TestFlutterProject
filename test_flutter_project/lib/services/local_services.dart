
import '../database/local_db.dart';

class LocalService {

  static final client = AppDatabase();

  getDatabase() {
    return client;
  }
}
