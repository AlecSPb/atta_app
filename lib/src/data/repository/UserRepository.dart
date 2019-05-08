import 'package:atta_mobile_app/src/data/models/UserModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class UserRepository extends Repository {
   Future<void> signInWithEmailAndPassword(UserModel user);
   Future<bool> signInWithTwitter();
   Future<bool> signInWithFacebook();
   Future<bool> signInWithGoogle();
   Future<bool> regNewUser(UserModel usermodel);
}