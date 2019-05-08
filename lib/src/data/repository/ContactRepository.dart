import 'package:atta_mobile_app/src/data/models/ContactModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class ContactRepository extends Repository {
  Future<ContactModel> getContact();
  Future<bool> sendContactMsg(String msg);
}
