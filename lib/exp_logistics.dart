// бул компаниада сонгы логин блок жасадым дио интерсепторды дурыстадым 
// токен веб сервиста hive, shared preferences сактай алмагандыктан flutter_secure_storage кодандым біракк сожелению ол да сактай алмай жатыр 
// әзірге осы проблемада катып калдым

// import 'package:dio/dio.dart';
// import 'package:flutterwebhosting/src/core/api/client/endpoints.dart';
// import 'package:flutterwebhosting/src/core/api/client/rest/dio/dio_client.dart';
// import 'package:flutterwebhosting/src/core/exceptions/domain_exception.dart';
// import 'package:flutterwebhosting/src/core/service/storage/flutter_secure_storage.dart';
// import 'package:flutterwebhosting/src/features/auth/data/models/login_model.dart';
// import 'package:flutterwebhosting/src/features/auth/domain/request/login_request.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';

// import 'i_auth_remote.dart';

// @named
// @LazySingleton(as: IAuthRemote)
// class AuthRemoteImpl implements IAuthRemote {
//   Dio get dioClient => DioInterceptor(Dio()).getDio;
//   final FlutterSecure flutterSecure = FlutterSecure();
//   @override
//   Future<Either<DomainException, LoginModel>> login(LoginRequest request) async {
//     try {
//       final response = await dioClient.post(
//         EndPoints.login,
//         data: request.toJson(),
//       );

//       if (response.statusCode == 200) {
//         final dto = LoginModel.fromJson(response.data);
        
//         await flutterSecure.setAccessToken(dto.result.token);
//         return Right(dto);
//       } else {
//         return Left(
//           UnknownException(message: 'Error: ${response.statusCode}'),
//         );
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

// }
