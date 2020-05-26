import 'db.dart';
import 'models.dart';

class Global {

  static final Map models = {
    User: (data) => User.fromFirestore(data),
  };

  static final UserDocument<User> userDocument = UserDocument<User>();

}