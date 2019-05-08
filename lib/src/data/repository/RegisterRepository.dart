
import 'package:atta_mobile_app/src/data/models/RegisterModel.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class RegisterRepository extends Repository {
  Future<List<RegisterModel>> getAllRegister(String username , String email ,
   String telephone , String studenCode , String password );
}