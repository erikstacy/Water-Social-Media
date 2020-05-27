import 'db.dart';
import 'models.dart';

class Global {

  static final Map models = {
    User: (data) => User.fromFirestore(data),
    Post: (data) => Post.fromFirestore(data),
  };

  static final UserDocument<User> userDocument = UserDocument<User>();
  static final Collection<Post> postCollection = Collection<Post>(path: 'posts');

}