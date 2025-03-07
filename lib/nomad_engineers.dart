// Писал полный контрагент и корзина пейдж dleivery page реализациясын жасадым и проекттын новый 4 билд жасап Apple Connect Test Flight ка салдым для тестировки


// Ендпойнты   // Counter Party

  // static const String createCounterParty = '/counter-party';
  // static const String getCounterParties = '/counter-party';
  // static String getOneCounterParty(int id) => '/counter-party/$id';
  // static String deleteContact(int id) => '/counter-party-contact/${id}';
  // static String getCounterParty(String id) => '/payment-card/$id';
  // static const String createContact = '/counter-party-contact';

// осы ендпойнттардын полный реализациясын жасадым



// datasource counter agent


// import 'package:dio/dio.dart';
// import 'package:fpdart/src/either.dart';
// import 'package:injectable/injectable.dart';
// import 'package:phase/src/core/api/client/endpoints.dart';
// import 'package:phase/src/core/api/client/rest/dio/dio_client.dart';
// import 'package:phase/src/core/exceptions/domain_exception.dart';
// import 'package:phase/src/features/counter_party/data/data_sources/remote/i_counter_party_remote.dart';
// import 'package:phase/src/features/counter_party/data/models/counter_party_dto.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_agent_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_create_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_get_all_request.dart';

// @named
// @LazySingleton(as: ICounterPartyRemote)
// class CounterPartyRemoteImpl implements ICounterPartyRemote {
//   Dio get dioClient => DioInterceptor(Dio()).getDio;

//   @override
//   Future<Either<DomainException, CounterPartyDto>> getOneWithManagerId(CounterAgentRequest request) async {
//     try {
//       final response = await dioClient.get(
//         EndPoints.getCounterParties,
//         queryParameters: {
//           'relations': 'contactPerson.manager',
//           'search[contactPerson][manager][id]': request.managerId,
//         },
//       );

//       if (response.statusCode == 200) {
//         final counterPartyList = CounterPartyDto.fromJson(response.data);
//         return Right(counterPartyList);
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
//   Future<Either<DomainException, void>> deleteContact(CounterPartyGetOneRequest request) async {
//     try {
//       final response = await dioClient.delete(
//         EndPoints.deleteContact(request.id),
//       );

//       if (response.statusCode == 200) {
//         return Right(response.data);
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
//   Future<Either<DomainException, CounterPartyDto>> getAll() async {
//     try {
//       var queryParameters = {
//         'relations': 'contactPerson.manager',
//       };



//       final response = await dioClient.get(
//         EndPoints.getCounterParties,
//         queryParameters: queryParameters
//       );
//       print(response.statusCode);

//       if (response.statusCode == 200) {
//         final counterPartyList = CounterPartyDto.fromJson(response.data);
//         print('data layer successs');
//         print(response.statusCode);
//         return Right(counterPartyList);
//       } else {
//         print(response.statusCode);
//         return Left(UnknownException(message: 'Error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       print('failure');
//       return Left(
//         e is DomainException ? e : UnknownException(message: e.toString()),
//       );
//     }
//   }

//   @override
//   Future<Either<DomainException, CounterAgentDto>> getOne(CounterAgentRequest request) async {
//     try {
//       var queryParameters = {
//         'relations': 'contactPerson.manager',
//         // 'search[contactPerson][manager][id]': request.managerId,
//       };



//       final response = await dioClient.get(
//         EndPoints.getOneCounterParty(request.id),
//         queryParameters: queryParameters
//       );

//       if (response.statusCode == 200) {
//         final counterPartyList = CounterAgentDto.fromJson(response.data);
//         return Right(counterPartyList);
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
//   Future<Either<DomainException, ContactPersonDto>> createContact(CounterPartyCreateRequest request) async {
//     try {
//       final response = await dioClient.post(
//         EndPoints.createContact,
//         data: request.toJson(), 
//       );

//       if (response.statusCode == 201) {
//         final counterPartyList = ContactPersonDto.fromJson(response.data);
//         return Right(counterPartyList);
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

// file repository in data layer


// import 'package:fpdart/fpdart.dart';
// import 'package:phase/src/core/exceptions/domain_exception.dart';
// import 'package:phase/src/features/counter_party/data/models/counter_party_dto.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_create_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_get_all_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_agent_request.dart';

// abstract class ICounterPartyRemote {
//   Future<Either<DomainException, CounterPartyDto>> getAll();
//   Future<Either<DomainException, CounterAgentDto>> getOne(
//     CounterAgentRequest request,
//   );
//   Future<Either<DomainException, ContactPersonDto>> createContact(
//     CounterPartyCreateRequest request,
//   );
//   Future<Either<DomainException, void>> deleteContact(
//     CounterPartyGetOneRequest request,
//   );
//   Future<Either<DomainException, CounterPartyDto>> getOneWithManagerId(
//     CounterAgentRequest request,
//   );
// }


// BLOC всех запросоав 



// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:phase/src/core/base/base_bloc/bloc/base_bloc.dart';
// import 'package:phase/src/core/models/meta.dart';
// import 'package:phase/src/features/counter_party/data/models/counter_party_dto.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_agent_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_create_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_get_all_request.dart';
// import 'package:phase/src/features/counter_party/domain/requests/counter_party_request.dart';
// import 'package:phase/src/features/counter_party/domain/usecases/counter_party_get_all_usecase.dart';
// import 'package:phase/src/features/counter_party/domain/usecases/counter_party_get_one_usecase.dart';
// import 'package:phase/src/features/counter_party/domain/usecases/create_contact_usecase.dart';
// import 'package:phase/src/features/counter_party/domain/usecases/get_one_contact_usecase.dart';

// part 'counter_event.dart';
// part 'counter_state.dart';
// part 'counter_bloc.freezed.dart';


// class CounterBloc extends BaseBloc<CounterEvent, CounterState> {
//   CounterBloc(this.getAllCounterAgent, this.getOneCounterAgent, this.createContact, this.deleteContactUsecase, this.getOneContactUsecase) : super(CounterState.initial());

//   final CounterPartyGetAllUsecase getAllCounterAgent;
//   final CounterPartyGetOneUsecase getOneCounterAgent;
//   final CreateContactUsecase createContact;
//   final DeleteContactUsecase deleteContactUsecase;
//   final GetOneContactUsecase getOneContactUsecase;

//   @override
//   Future<void> onEventHandler(CounterEvent event, Emitter emit) async {
//     await event.when(
//       getOneWithManagerId: (id, managerId) => _getOneCounterAgentWithManagerId(event as _GetOneCounterAgentWithManagerId, emit),
//       deleteContact: (id, counterAgentId) => _deleteContact(event as _DeleteContact, emit),
//       getOne: (_, __) => _getOneCounterAgent(event as _GetOneCounterAgent, emit),
//       getAll: () => _getAllCounterAgent(event as _GetAllCounterAgent, emit),
//       addContact: (a, b, c, d, e) => _addContact(event as _AddContact, emit),
//     );
//   }

//   Future<void> _getOneCounterAgentWithManagerId(
//     _GetOneCounterAgentWithManagerId event,
//     Emitter emit,
//   ) async {
//     emit(const CounterState.loading());
//     final request = CounterAgentRequest(id: event.id, managerId: event.managerId);
//     final result = await getOneContactUsecase.call(request);
//     if (result.isSuccessful) {
//       emit(CounterState.loaded(viewModel: CounterViewModel(counterPartyDto: result.data)));
//     } else {
//       emit(const CounterState.loadingFailure());
//     }
//   }

//   Future<void> _deleteContact(
//     _DeleteContact event,
//     Emitter emit,
//   ) async {
//     // emit(const CounterState.loading());
//     final request = CounterPartyGetOneRequest(id: event.id);
//     final result = await deleteContactUsecase.call(request);
//     if (result.isSuccessful) {
//       final updatedResult = await getOneContactUsecase.call(CounterAgentRequest(id: event.counterAgentId, managerId: 1));
//       emit(CounterState.loaded(viewModel: CounterViewModel(counterPartyDto: updatedResult.data)));
//     } else {
//       emit(const CounterState.loadingFailure());
//     }
//   }

//   Future<void> _addContact(
//     _AddContact event,
//     Emitter emit,
//   ) async {
//     final request = CounterPartyCreateRequest(
//       counterPartyId: event.counterPartyId,
//       fullName: event.fullName,
//       phone: event.phone,
//       email: event.email,
//       address: event.address,
//     );
//     final result = await createContact.call(request);
//     if (result.isSuccessful) {
//       final updatedResult = await getOneContactUsecase.call(CounterAgentRequest(id: event.counterPartyId, managerId: 1, ));
//       emit(CounterState.loaded(viewModel: CounterViewModel(counterPartyDto: updatedResult.data)));
//     } else {
//       emit(const CounterState.loadingFailure());
//     }
//   }









//   Future<void> _getAllCounterAgent(
//     _GetAllCounterAgent event,
//     Emitter emit,
//   ) async {
//     emit(const CounterState.loading());
//     final result = await getAllCounterAgent.call();
//     if(result.isSuccessful){
//       emit(CounterState.loaded(viewModel: CounterViewModel(counterPartyDto: result.data)));
//     }
//   }

//   Future<void> _getOneCounterAgent(
//     _GetOneCounterAgent event,
//     Emitter emit,
//   ) async {
//     emit(const CounterState.loading());
//     final request = CounterAgentRequest(id: event.id, managerId: event.managerId);

//     final result = await getOneCounterAgent.call(request);
//     if (result.isSuccessful) {
//       emit(CounterState.loaded(viewModel: CounterViewModel(counterAgentDto: result.data)));
//     } else {
//       emit(const CounterState.loadingFailure());
//     }
//   }
  
// }



// решил баги и недостатоктарды костым релизга дайындадым



