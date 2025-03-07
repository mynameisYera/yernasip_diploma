// бул жерде барлык дайын болган ендпойнттар проектке косылган DataSource layer


// import 'package:dio/dio.dart';
// import 'package:flutterwebhosting/src/core/api/client/endpoints.dart';
// import 'package:flutterwebhosting/src/core/api/client/rest/dio/dio_client.dart';
// import 'package:flutterwebhosting/src/core/exceptions/domain_exception.dart';
// import 'package:flutterwebhosting/src/features/home/data/datasources/remote/i_ad_remote.dart';
// import 'package:flutterwebhosting/src/features/home/data/models/banner/banner_model.dart';
// import 'package:flutterwebhosting/src/features/home/data/models/car_category/car_category_model.dart';
// import 'package:flutterwebhosting/src/features/home/domain/requests/add_ad_request.dart';
// import 'package:flutterwebhosting/src/features/home/domain/requests/create_car_category_request.dart';
// import 'package:flutterwebhosting/src/features/home/domain/requests/update_ad_request.dart';
// import 'package:flutterwebhosting/src/features/home/domain/requests/update_category_request.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:injectable/injectable.dart';

// @named
// @LazySingleton(as: IAdRemote)
// class AdRemoteImpl implements IAdRemote {
//   Dio get dioClient => DioInterceptor(Dio()).getDio;

//   @override
//   Future<Either<DomainException, void>> updateCarType(String id, String name, String image) async {
//     try {
//       final response = await dioClient.put(
//         EndPoints.useCarTypeById(id),
//         data: {
//           "name": name,
//           "image": image,
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null); 
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     } 
//   } 

//   @override
//   Future<Either<DomainException, void>> createCarType(String name, String image) async {
//     try {
//       final response = await dioClient.post(
//         EndPoints.getCarTypes,
//         data: {
//           "name": name,
//           "image": image,
//           "isDefault": false
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   } 

//   @override
//   Future<Either<DomainException, void>> deleteCarType(String id) async {
//     try {
//       final response = await dioClient.delete(
//         EndPoints.useCarTypeById(id),
//         data: {
//           'id': id,
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, CarCategoryResponse>> getCarTypeList() async {
//     try {
//       final response = await dioClient.get(
//         EndPoints.getCarTypes,
//       );  

//       if (response.statusCode == 200) {
//         return Right(CarCategoryResponse.fromJson(response.data));
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, void>> updateCarCategory(UpdateCategoryRequest request) async {
//     try {
//       final response = await dioClient.put(
//         EndPoints.useCarById(request.id),
//         data: {
//           "image": request.image,
//           "name": request.name,
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, void>> deleteCarCategory(String id) async {
//     try {
//       final response = await dioClient.delete(
//         EndPoints.useCarById(id),
//         data: {
//           'id': id,
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );  
//     }
//   }

//   @override
//   Future<Either<DomainException, void>> createCarCategory(CreateCarCategoryRequest request) async {
//     try {
//       final response = await dioClient.post(
//         EndPoints.getCarCategories,
//         data: request.toJson(),
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) { 
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, void>> updateBanner(UpdateAdRequest request) async {
//     try {
//       final response = await dioClient.put(
//         EndPoints.deleteAd(request.id),
//         data: {
//           "image": request.image,
//           "link": request.link,
//           "navigate": request.navigate
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }


//   Future<Either<DomainException, BannerModel>> getAdList() async {
//     try {
//       final response = await dioClient.get(
//         EndPoints.getAdList,
//       );

//       if (response.statusCode == 200) {
//         final paymentCard = BannerModel.fromJson(response.data);
//         return Right(paymentCard);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }


//   @override
//   Future<Either<DomainException, CarCategoryResponse>> getCarCategoryList() async {
//     try {
//       final response = await dioClient.get(
//         EndPoints.getCarCategories,
//       );

//       if (response.statusCode == 200) {
//         try {
//           // Transform the data to handle invalid name values
//           final Map<String, dynamic> data = Map.from(response.data);
//           if (data['result'] != null) {
//             final List<dynamic> results = data['result'];
//             for (var i = 0; i < results.length; i++) {
//               if (results[i]['name'] == null || results[i]['name'] is String) {
//                 results[i]['name'] = {
//                   'kz': '',
//                   'ru': '',
//                   'en': '',
//                   'uz': '',
//                   'kg': '',
//                   'cn': '',
//                 };
//               }
//             }
//           }
          
//           final categoryResponse = CarCategoryResponse.fromJson(data);
//           return Right(categoryResponse);
//         } catch (e) {
//           return Left(UnknownException(message: 'Failed to parse response: $e'));
//         }
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, AnswerBannerItem>> createBanner(AddAdRequest request) async {
//     try {
//       final response = await dioClient.post(
//         EndPoints.postAd,
//         data: request.toJson(),
//       );

//       if (response.statusCode == 200) {
//         return Right(AnswerBannerItem.fromJson(response.data));
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }


//   @override
//   Future<Either<DomainException, void>> deleteAd(String id) async {
//     try {
//       final response = await dioClient.delete(
//         EndPoints.deleteAd(id),
//         data: {
//           'id': id,
//         },
//       );

//       if (response.statusCode == 200) {
//         return Right(null);
//       } else {
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }
// }
