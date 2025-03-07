// бул жерде тек ui жұмыстар берді

//chat page 

// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:matrix/matrix.dart';
// import 'package:mobile_prosecutor/core/common/custom_textfield.dart';
// import 'package:mobile_prosecutor/core/topbar/topbar.dart';
// import 'package:mobile_prosecutor/features/chat/screens/create_chat.dart';
// import 'package:mobile_prosecutor/features/chat/screens/create_group.dart';
// import 'package:mobile_prosecutor/features/chat/widgets/chat_list_item.dart';
// import 'package:mobile_prosecutor/matrix.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../core/common/category_navigation.dart';
// import '../../../core/constants/text_styles.dart';
// import '../../../lang/locale_keys.g.dart';
// import '../widgets/create_chat_button.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final PageController controller = PageController();
//   int page = 0;

//   changePage(int p) {
//     controller.animateToPage(p, duration: const Duration(milliseconds: 200), curve: Curves.ease);
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((c) async {
//       await Permission.phone.request();
//     });
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     final client = Matrix.of(context).client;
//     return Container(
//       color: const Color.fromRGBO(248, 248, 248, 1.0),
//       child: Column(
//         children: [
//           TopBar(
//             content: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(LocaleKeys.chat.tr(context: context), style: topbarTitle),
//                 CreateChatButton(
//                   title: page != 0
//                       ? LocaleKeys.createchat.tr(context: context)
//                       : LocaleKeys.creategroup.tr(context: context),
//                   onClick: () {
//                     if (page == 0) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const CreateGroup()),
//                       );
//                     } else {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CreateChat(
//                             userType: page == 1 ? 'prosecutor' : 'citizen',
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: CustomTextField(
//               fillColor: const Color(0xffffffff),
//               hintText: LocaleKeys.search.tr(context: context),
//               leftIcon: const Icon(
//                 Icons.search,
//                 color: Colors.black54,
//                 size: 28,
//               ),
//               borderColor: Colors.white,
//               enableBorderColor: Colors.white,
//               shadow: true,
//             ),
//           ),
//           CategoryNavigation(
//             categories: [
//               {"name": LocaleKeys.groups.tr(context: context), 'id': 0},
//               {"name": LocaleKeys.workchat.tr(context: context), 'id': 1},
//               {"name": LocaleKeys.citizenchat.tr(context: context), 'id': 2}
//             ],
//             current: page,
//             changePage: changePage,
//           ),
//           StreamBuilder(
//             stream: client.onSync.stream,
//             builder: (context, AsyncSnapshot snapshot) {
//               // if (snapshot.connectionState == ConnectionState.waiting) {
//               //   return const Center(child: LoadingCircle());
//               // }

//               List<Room> groups = client.rooms.where((room) => !room.isDirectChat).toList();

//               List<Room> prosecutors = client.rooms
//                   .where((room) => room.isDirectChat && (room.directChatMatrixID?.contains('@user') ?? false))
//                   .toList();

//               List<Room> citizens = client.rooms
//                   .where((room) => room.isDirectChat && (room.directChatMatrixID?.contains('@citizen') ?? false))
//                   .toList();

//               return Expanded(
//                 child: PageView(
//                   onPageChanged: (p) {
//                     setState(() {
//                       page = p;
//                     });
//                   },
//                   controller: controller,
//                   children: [
//                     Container(
//                       color: Colors.transparent,
//                       child: ListView.builder(
//                         padding: const EdgeInsets.all(0).copyWith(top: 12),
//                         shrinkWrap: true,
//                         itemCount: groups.length,
//                         itemBuilder: (context, i) => ChatListItem(
//                           room: groups[i],
//                           client: client,
//                           key: ValueKey('$i'),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.transparent,
//                       child: ListView.builder(
//                         padding: const EdgeInsets.all(0).copyWith(top: 12),
//                         shrinkWrap: true,
//                         itemCount: prosecutors.length,
//                         itemBuilder: (context, i) => ChatListItem(
//                           client: client,
//                           room: prosecutors[i],
//                           key: ValueKey('$i'),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       color: Colors.transparent,
//                       child: ListView.builder(
//                         padding: const EdgeInsets.all(0).copyWith(top: 12),
//                         shrinkWrap: true,
//                         itemCount: citizens.length,
//                         itemBuilder: (context, i) => ChatListItem(
//                           client: client,
//                           room: citizens[i],
//                           key: ValueKey('$i'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }



// и локализация в пейджах в блок opc

// import 'dart:convert';
// import 'dart:io';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:mobile_prosecutor/core/topbar/topbar.dart';
// import 'package:mobile_prosecutor/features/opc/logic/bloc/opc_create/opc_create_bloc.dart';
// import 'package:mobile_prosecutor/features/opc/logic/map.dart';
// import 'package:mobile_prosecutor/features/opc/screens/opc_view_screen.dart';
// import 'package:mobile_prosecutor/features/opc/widgets/map.dart';
// import 'package:mobile_prosecutor/features/opc/widgets/ops_loading_state.dart';
// import 'package:mobile_prosecutor/lang/locale_keys.g.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../../../core/constants/text_styles.dart';
// import '../../../core/get_it/injection_container.dart';
// import 'package:flutter_map/flutter_map.dart';

// class OpcEdit extends StatefulWidget {
//   final int id;
//   final String? initialOpcName;
//   final String? initialDescription;
//   final String? initialNumberKui;
//   final String? initialNumberErdr;
//   final String? initialApartment;
//   final int? initialOpsSphere;
//   final int? initialOpsView;
//   final int? initialOpsRegion;
//   final String? initialOpsProsecutor;
//   final String? initialStatus;
//   final String? initialDate;
//   final String? city;
//   final String? district;
//   final String? street;
//   final String? house;
//   final String? apartment;
//   final int? status;
//   final bool isJournalistRelatedIncident;
//   final bool isUnderageIncident;
//   final bool isMilitaryIncident;
//   final bool isLawEnforcementIncident;
//   final String? victims;
//   final String? injured;
//   final String? finishDate;
//   final String? count;

//   const OpcEdit(
//       {Key? key,
//       required this.id,
//       this.initialOpcName,
//       this.initialDescription,
//       this.initialNumberKui,
//       this.initialNumberErdr,
//       this.initialApartment,
//       this.initialOpsSphere,
//       this.initialOpsView,
//       this.initialOpsRegion,
//       this.initialOpsProsecutor,
//       this.initialDate,
//       this.city,
//       this.district,
//       this.street,
//       this.house,
//       this.apartment,
//       this.status,
//       required this.isLawEnforcementIncident,
//       required this.isMilitaryIncident,
//       required this.isUnderageIncident,
//       required this.isJournalistRelatedIncident,
//       this.injured,
//       this.victims,
//       this.finishDate,
//       this.count,
//       this.initialStatus})
//       : super(key: key);

//   @override
//   State<OpcEdit> createState() => _OpcEditState();
// }

// class _OpcEditState extends State<OpcEdit> {
//   late TextEditingController opcNameController;
//   late TextEditingController descriptionController;
//   late TextEditingController numberKuiController;
//   late TextEditingController numberErdrController;
//   late TextEditingController apartmentController;
//   late TextEditingController victimsController;
//   late TextEditingController injuredController;
//   late TextEditingController countController;

//   String? selectedOpsSphere;
//   String? selectedOpsView;
//   String? selectedOpsRegion;
//   String? selectedProsecutorOrgan;
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;
//   DateTime? selectedFinishDate;
//   TimeOfDay? selectedFinishedTime;
//   String? selectedFileName;
//   String? selectedStatus;
//   Map selectedAddres = {};
//   String? _currentAddress;
//   List<Map<String, dynamic>> reportAttachments = [];
//   Map<String, dynamic>? reportImage;
//   double? _latitude;
//   double? _longitude;
//   String? city;
//   String? district;
//   String? street;
//   String? house;
//   late bool isJournalistRelatedIncident;
//   late bool isUnderageIncident;
//   late bool isMilitaryIncident;
//   late bool isLawEnforcementIncident;

//   MapController mapController = MapController();

//   @override
//   void initState() {
//     super.initState();

//     // Initialize controllers with either passed values or empty
//     opcNameController = TextEditingController(text: widget.initialOpcName?.toString() ?? '');
//     descriptionController = TextEditingController(text: widget.initialDescription?.toString() ?? '');
//     numberKuiController = TextEditingController(text: widget.initialNumberKui?.toString() ?? '');
//     numberErdrController = TextEditingController(text: widget.initialNumberErdr?.toString() ?? '');
//     apartmentController = TextEditingController(text: widget.initialApartment?.toString() ?? '');
//     victimsController = TextEditingController(text: widget.victims?.toString() ?? '');
//     injuredController = TextEditingController(text: widget.injured?.toString() ?? '');
//     countController = TextEditingController(text: widget.count?.toString() ?? '');

//     isJournalistRelatedIncident = widget.isJournalistRelatedIncident;
//     isUnderageIncident = widget.isUnderageIncident;
//     isMilitaryIncident = widget.isMilitaryIncident;
//     isLawEnforcementIncident = widget.isLawEnforcementIncident;

//     selectedOpsSphere = widget.initialOpsSphere.toString();
//     selectedOpsView = widget.initialOpsView.toString();
//     selectedOpsRegion = widget.initialOpsRegion.toString();
//     selectedProsecutorOrgan = widget.initialOpsProsecutor.toString();
//     selectedStatus = widget.initialStatus;

//     if (widget.initialDate != null) {
//       DateTime parsedDate = DateTime.parse(widget.initialDate!);
//       selectedDate = parsedDate;
//       selectedTime = TimeOfDay(hour: parsedDate.hour, minute: parsedDate.minute);
//     }

//     if (widget.finishDate != null) {
//       DateTime parsedDate = DateTime.parse(widget.finishDate!);
//       selectedFinishDate = parsedDate;
//       selectedFinishedTime = TimeOfDay(hour: parsedDate.hour, minute: parsedDate.minute);
//     }
//   }

//   String? combineDateAndTime(DateTime? selectedDate, TimeOfDay? selectedTime) {
//     if (selectedDate != null && selectedTime != null) {
//       final DateTime combinedDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         selectedTime.hour,
//         selectedTime.minute,
//       );
//       return DateFormat('yyyy-MM-dd HH:mm').format(combinedDateTime);
//     }
//     return null;
//   }

//   void onSelectedAddress(add) {
//     setState(() {
//       selectedAddres = add;
//     });
//   }

//   int getIdByName(List<dynamic> data, String name) {
//     for (var item in data) {
//       if (item['name'] == name) {
//         return item['id'];
//       }
//     }
//     return -1; // Return -1 if no match is found
//   }

//   Future<void> _getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       setState(() {
//         _latitude = null;
//         _longitude = null;
//       });
//       return;
//     }

// PermissionStatus permission = await Permission.locationWhenInUse.request();
//     if (permission == PermissionStatus.denied) {
//       permission = await Permission.locationWhenInUse.request();
//       if (permission == PermissionStatus.denied) {
//         setState(() {
//           _latitude = null;
//           _longitude = null;
//         });
//         return;
//       }
//     }

//     if (permission == PermissionStatus.permanentlyDenied) {
//       setState(() {
//         _latitude = null;
//         _longitude = null;
//       });
//       return;
//     }

//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).timeout(
//       Duration(seconds: 3),
//       onTimeout: () {
//         return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//       },
//     );
//     setState(() {
//       _latitude = position.latitude;
//       _longitude = position.longitude;
//       _getAddressFromLatLng(_latitude, _longitude);
//     });
//   }

//   Future<void> _getAddressFromLatLng(double? latt, double? long) async {
//     await placemarkFromCoordinates(latt!, long!).then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         street = place.thoroughfare;
//         city = place.administrativeArea;
//         district = place.subLocality;
//         house = place.subThoroughfare;
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             TopBar(
//               content: Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                   Text(LocaleKeys.edit_event.tr(context: context),
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600, fontSize: 15, fontFamily: 'Montserrat', color: Colors.white)),
//                 ],
//               ),
//             ),
//             BlocProvider(
//               create: (context) =>
//                   sl<OpcCreateBloc>()..add(GetOpcData(widget.initialOpsSphere ?? 0, widget.initialOpsRegion ?? 0)),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     // Name input
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: opcNameController,
//                         decoration: InputDecoration(
//                           hintText: LocaleKeys.ops_name.tr(context: context),
//                           hintStyle: TextStyle(
//                               color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w300, fontFamily: 'Montserrat'),
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                     // Spheres Dropdown
//                     BlocBuilder<OpcCreateBloc, OpcCreateState>(
//                       builder: (context, state) {
//                         if (state is OpcCreateLoading) {
//                           return OpsLoadingState();
//                         }
//                         if (state is OpcCreateSuccess) {
//                           List<DropdownMenuItem<String>> spheres = state.spheres.map((field) {
//                             return DropdownMenuItem<String>(
//                               value: field['id'].toString(),
//                               child: Text(
//                                 field['name'],
//                                 style: const TextStyle(
//                                     fontSize: 13,
//                                     color: Colors.black,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w400),
//                               ),
//                             );
//                           }).toList();

//                           return Container(
//                             height: 50,
//                             margin: const EdgeInsets.symmetric(vertical: 8.0),
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.blue.shade900,
//                                 ),
//                                 value: selectedOpsSphere,
//                                 hint: Text(
//                                   LocaleKeys.select_area_offense.tr(context: context),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.grey,
//                                       fontSize: 13,
//                                       fontFamily: 'Montserrat'),
//                                 ),
//                                 items: spheres,
//                                 onChanged: (String? newValue) {
//                                   if (newValue != null) {
//                                     setState(() {
//                                       selectedOpsSphere = newValue;
//                                       selectedOpsView = null;
//                                     });
//                                     BlocProvider.of<OpcCreateBloc>(context)
//                                         .add(GetOpcData(int.tryParse(newValue) ?? 0, 0));
//                                   }
//                                 },
//                                 dropdownColor: Colors.white,
//                                 isExpanded: true,
//                                 isDense: true,
//                                 style: const TextStyle(color: Colors.black, fontSize: 13, fontFamily: 'Montserrat'),
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox();
//                       },
//                     ),
//                     BlocBuilder<OpcCreateBloc, OpcCreateState>(
//                       builder: (context, state) {
//                         if (state is OpcCreateSuccess) {
//                           List<DropdownMenuItem<String>>? views = state.views.map((field) {
//                             return DropdownMenuItem<String>(
//                               value: field['id'].toString(),
//                               child: Text(
//                                 field['name'],
//                                 style: const TextStyle(fontSize: 13, color: Colors.black, fontFamily: 'Montserrat'),
//                               ),
//                             );
//                           }).toList();

//                           return Container(
//                             height: 60,
//                             margin: const EdgeInsets.symmetric(vertical: 8.0),
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.blue.shade900,
//                                 ),
//                                 value: selectedOpsView,
//                                 hint: Text(
//                                   LocaleKeys.select_type_offense.tr(context: context),
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.grey, // Text color similar to the image
//                                       fontSize: 13,
//                                       fontFamily: 'Montserrat'),
//                                 ),
//                                 items: views,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedOpsView = newValue;
//                                   });
//                                 },
//                                 dropdownColor: Colors.white,
//                                 isExpanded: true,
//                                 isDense: true,
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 13,
//                                     fontFamily: 'Montserrat',
//                                     fontWeight: FontWeight.w400),
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox(); // Чтобы не исчезало, просто возвращаем пустой контейнер
//                       },
//                     ),
//                     BlocBuilder<OpcCreateBloc, OpcCreateState>(
//                       builder: (context, state) {
//                         if (state is OpcCreateSuccess) {
//                           List<DropdownMenuItem<String>>? regions = state.regions.map((field) {
//                             return DropdownMenuItem<String>(
//                               value: field['id'].toString(),
//                               child: Text(
//                                 field['name'],
//                                 style: const TextStyle(fontSize: 13, color: Colors.black),
//                               ),
//                             );
//                           }).toList();

//                           return Container(
//                             height: 50,
//                             margin: const EdgeInsets.symmetric(vertical: 8.0),
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.blue.shade900,
//                                 ),
//                                 value: selectedOpsRegion,
//                                 hint: Text(
//                                   LocaleKeys.select_region.tr(context: context),
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.grey, // Text color similar to the image
//                                       fontSize: 16),
//                                 ),
//                                 items: regions,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedOpsRegion = newValue;
//                                   });
//                                   BlocProvider.of<OpcCreateBloc>(context).add(GetOpcData(
//                                       int.tryParse(selectedOpsSphere!) ?? 0, int.tryParse(selectedOpsRegion!) ?? 0));
//                                 },
//                                 dropdownColor: Colors.white,
//                                 isExpanded: true,
//                                 isDense: true,
//                                 style: const TextStyle(color: Colors.black, fontSize: 16),
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox();
//                       },
//                     ),
//                     BlocConsumer<OpcCreateBloc, OpcCreateState>(
//                       listener: (context, state) {
//                         if (state is OpcCreateSuccess) {
//                           selectedProsecutorOrgan =
//                               getIdByName(state.prosecutors, selectedProsecutorOrgan ?? '').toString();
//                         }
//                       },
//                       builder: (context, state) {
//                         if (state is OpcCreateSuccess) {
//                           List<DropdownMenuItem<String>> organs = state.prosecutors
//                               .map<DropdownMenuItem<String>>((field) => DropdownMenuItem<String>(
//                                     value: field['id'].toString(),
//                                     child: Text(
//                                       field['name'],
//                                       style: const TextStyle(fontSize: 12, color: Colors.black),
//                                     ),
//                                   ))
//                               .toList();

//                           // Ensure selectedProsecutorOrgan is in the items list, otherwise set it to null
//                           if (selectedProsecutorOrgan != null &&
//                               !organs.any((item) => item.value == selectedProsecutorOrgan)) {
//                             selectedProsecutorOrgan = null;
//                           }

//                           return Container(
//                             height: 70,
//                             margin: const EdgeInsets.symmetric(vertical: 8.0),
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.blue.shade900,
//                                 ),
//                                 value: selectedProsecutorOrgan,
//                                 hint: Text(
//                                   LocaleKeys.select_prosecutor.tr(context: context),
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w300,
//                                     color: Colors.grey,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 items: organs,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedProsecutorOrgan = newValue;
//                                   });
//                                 },
//                                 dropdownColor: Colors.white,
//                                 isExpanded: true,
//                                 isDense: true,
//                                 style: const TextStyle(color: Colors.black, fontSize: 16),
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox();
//                       },
//                     ),
//                     BlocBuilder<OpcCreateBloc, OpcCreateState>(
//                       builder: (context, state) {
//                         if (state is OpcCreateSuccess) {
//                           List<DropdownMenuItem<String>>? statuses = state.statuses.map((field) {
//                             return DropdownMenuItem<String>(
//                               value: field['id'].toString(),
//                               child: Text(
//                                 field['name'],
//                                 style: const TextStyle(fontSize: 12, color: Colors.black),
//                               ),
//                             );
//                           }).toList();

//                           return Container(
//                             height: 70,
//                             margin: const EdgeInsets.symmetric(vertical: 8.0),
//                             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(
//                                 icon: Icon(
//                                   Icons.arrow_drop_down,
//                                   color: Colors.blue.shade900,
//                                 ),
//                                 value: selectedStatus,
//                                 hint: const Text(
//                                   'Статус ОПС',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       color: Colors.grey, // Text color similar to the image
//                                       fontSize: 16),
//                                 ),
//                                 items: statuses,
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     selectedStatus = newValue;
//                                   });
//                                 },
//                                 dropdownColor: Colors.white,
//                                 isExpanded: true,
//                                 isDense: true,
//                                 style: const TextStyle(color: Colors.black, fontSize: 16),
//                                 borderRadius: BorderRadius.circular(9.0),
//                               ),
//                             ),
//                           );
//                         }
//                         return const SizedBox(); // Чтобы не исчезало, просто возвращаем пустой контейнер
//                       },
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CheckboxRow(
//                             initialValue: isJournalistRelatedIncident,
//                             text: LocaleKeys.journalists_activists.tr(context: context),
//                             onChanged: (value) {
//                               setState(() {
//                                 isJournalistRelatedIncident = value;
//                               });
//                             },
//                           ),
//                           CheckboxRow(
//                             initialValue: isUnderageIncident,
//                             text: LocaleKeys.minor_incidents.tr(context: context),
//                             onChanged: (value) {
//                               setState(() {
//                                 isUnderageIncident = value;
//                               });
//                             },
//                           ),
//                           CheckboxRow(
//                             initialValue: isMilitaryIncident,
//                             text: LocaleKeys.army_incidents.tr(context: context),
//                             onChanged: (value) {
//                               setState(() {
//                                 isMilitaryIncident = value;
//                               });
//                             },
//                           ),
//                           CheckboxRow(
//                             initialValue: isLawEnforcementIncident,
//                             text: LocaleKeys.organs_incidents.tr(context: context),
//                             onChanged: (value) {
//                               setState(() {
//                                 isLawEnforcementIncident = value;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                     ),

//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               labelText: LocaleKeys.event_date.tr(context: context),
//                               labelStyle: const TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w300,
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 13),
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: BorderSide.none, // Remove the border
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
//                               suffixIcon: const Padding(
//                                 padding: EdgeInsetsDirectional.only(end: 12.0),
//                                 child: Icon(Icons.calendar_today, color: Colors.brown), // Matching the icon color
//                               ),
//                             ),
//                             onTap: () async {
//                               DateTime? pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: selectedDate ?? DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2101),
//                               );
//                               if (pickedDate != null) {
//                                 setState(() {
//                                   selectedDate = pickedDate;
//                                 });
//                               }
//                             },
//                             validator: (value) {
//                               if (selectedDate == null) {
//                                 return LocaleKeys.please_choose_data.tr(context: context);
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(
//                               text: selectedDate != null ? "${selectedDate!.toLocal()}".split(' ')[0] : '',
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               labelText: LocaleKeys.event_date.tr(context: context),
//                               labelStyle: const TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w300,
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 13),
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: BorderSide.none, // Remove the border
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
//                               suffixIcon: const Padding(
//                                 padding: EdgeInsetsDirectional.only(end: 12.0),
//                                 child: Icon(Icons.access_time, color: Colors.brown), // Matching the icon color
//                               ),
//                             ),
//                             onTap: () async {
//                               TimeOfDay? pickedTime = await showTimePicker(
//                                 context: context,
//                                 initialTime: selectedTime ?? TimeOfDay.now(),
//                               );
//                               if (pickedTime != null) {
//                                 setState(() {
//                                   selectedTime = pickedTime;
//                                 });
//                               }
//                             },
//                             validator: (value) {
//                               if (selectedTime == null) {
//                                 return LocaleKeys.please_select_time.tr(context: context);
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(
//                               text: selectedTime != null ? selectedTime!.format(context) : '',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     10.verticalSpace,
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               labelText: LocaleKeys.end_time.tr(context: context),
//                               labelStyle: const TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w300,
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 13),
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: BorderSide.none, // Remove the border
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
//                               suffixIcon: const Padding(
//                                 padding: EdgeInsetsDirectional.only(end: 12.0),
//                                 child: Icon(Icons.calendar_today, color: Colors.brown), // Matching the icon color
//                               ),
//                             ),
//                             onTap: () async {
//                               DateTime? pickedDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: selectedFinishDate ?? DateTime.now(),
//                                 firstDate: DateTime(2000),
//                                 lastDate: DateTime(2101),
//                               );
//                               if (pickedDate != null) {
//                                 setState(() {
//                                   selectedFinishDate = pickedDate;
//                                 });
//                               }
//                             },
//                             validator: (value) {
//                               if (selectedFinishDate == null) {
//                                 return LocaleKeys.please_choose_data.tr(context: context);
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(
//                               text: selectedFinishDate != null ? "${selectedFinishDate!.toLocal()}".split(' ')[0] : '',
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         Expanded(
//                           child: TextFormField(
//                             readOnly: true,
//                             decoration: InputDecoration(
//                               labelText: LocaleKeys.end_time.tr(context: context),
//                               labelStyle: const TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.w300,
//                                   fontFamily: 'Montserrat',
//                                   fontSize: 13),
//                               fillColor: Colors.white,
//                               filled: true,
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: BorderSide.none, // Remove the border
//                               ),
//                               contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
//                               suffixIcon: const Padding(
//                                 padding: EdgeInsetsDirectional.only(end: 12.0),
//                                 child: Icon(Icons.access_time, color: Colors.brown), // Matching the icon color
//                               ),
//                             ),
//                             onTap: () async {
//                               TimeOfDay? pickedTime = await showTimePicker(
//                                 context: context,
//                                 initialTime: selectedFinishedTime ?? TimeOfDay.now(),
//                               );
//                               if (pickedTime != null) {
//                                 setState(() {
//                                   selectedFinishedTime = pickedTime;
//                                 });
//                               }
//                             },
//                             validator: (value) {
//                               if (selectedFinishedTime == null) {
//                                 return LocaleKeys.please_select_time.tr(context: context);
//                               }
//                               return null;
//                             },
//                             controller: TextEditingController(
//                               text: selectedFinishedTime != null ? selectedFinishedTime!.format(context) : '',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 12.0),
//                       height: 100,
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: descriptionController,
//                         decoration: InputDecoration(
//                           hintText: LocaleKeys.description.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                               color: Colors.grey, // Text color similar to the image
//                               fontSize: 13,
//                               fontWeight: FontWeight.w300,
//                               fontFamily: 'Montserrat'),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: numberKuiController,
//                         decoration: InputDecoration(
//                           hintText: LocaleKeys.kui_number.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                               color: Colors.grey, // Text color similar to the image
//                               fontSize: 13,
//                               fontWeight: FontWeight.w300,
//                               fontFamily: 'Montserrat'),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 16.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: numberErdrController,
//                         decoration: InputDecoration(
//                           hintText: LocaleKeys.erdr_number.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                               color: Colors.grey, // Text color similar to the image
//                               fontSize: 13,
//                               fontWeight: FontWeight.w300,
//                               fontFamily: 'Montserrat'),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 16.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: victimsController,
//                         keyboardType: TextInputType.number, // Numeric keyboard
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                         ],
//                         decoration: InputDecoration(
//                           labelText:
//                               LocaleKeys.number_people_victims.tr(context: context), // Label to describe the field
//                           labelStyle: const TextStyle(
//                             color: Colors.grey, // Style of the label text
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           hintText: LocaleKeys.number_people_victims.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                             color: Colors.grey, // Text color
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                           ),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 16.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: injuredController,
//                         keyboardType: TextInputType.number, // Numeric keyboard
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                         ],
//                         decoration: InputDecoration(
//                           labelText:
//                               LocaleKeys.number_people_injure.tr(context: context), // Label to describe the field
//                           labelStyle: const TextStyle(
//                             color: Colors.grey, // Style of the label text
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           hintText: LocaleKeys.number_people_injure.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                             color: Colors.grey, // Text color
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                           ),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(vertical: 16.0),
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: countController,
//                         keyboardType: TextInputType.number, // Numeric keyboard
//                         inputFormatters: [
//                           FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                         ],
//                         decoration: InputDecoration(
//                           labelText:
//                               LocaleKeys.number_people_present.tr(context: context), // Label to describe the field
//                           labelStyle: const TextStyle(
//                             color: Colors.grey, // Style of the label text
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           hintText: LocaleKeys.number_people_present.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                             color: Colors.grey, // Text color
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                           ),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     selectedAddres['display_name'] != null
//                         ? Container(
//                             padding: const EdgeInsets.all(6),
//                             margin: const EdgeInsets.all(6),
//                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.green),
//                             child: Text(selectedAddres['display_name'], style: buttonTitleWhite),
//                           )
//                         : const SizedBox(),
//                     Stack(
//                       children: [
//                         CustomMap(
//                           long: 0.0,
//                           latt: 0.0,
//                           marker: selectedAddres,
//                           onLocationPick: onSelectedAddress,
//                           initialaddress: _currentAddress,
//                           mapController: mapController,
//                         ),
//                         Positioned(
//                           top: 350,
//                           left: MediaQuery.sizeOf(context).width - 90,
//                           child: InkWell(
//                             onTap: () async {
//                               // Check if location services are enabled
//                               bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//                               if (!serviceEnabled) {
//                                 // Handle service not enabled
//                                 return;
//                               }
//                               await _getCurrentLocation();
//                               _getAddressFromLatLng(_latitude, _longitude);
//                               mapController.move(LatLng(_latitude ?? 0, _longitude ?? 0), mapController.camera.zoom);
//                               try {
//                                 var location = await getLocation('ru', LatLng(_latitude ?? 0, _longitude ?? 0));
//                                 setState(() {
//                                   selectedAddres = location.data;
//                                 });
//                                 if (selectedAddres['address'] != null) {
//                                   setState(() {
//                                     city = selectedAddres['address']['city'] ?? '';
//                                     street = selectedAddres['address']['road'] ?? '';
//                                     house = selectedAddres['address']['house_number'] ?? '';
//                                   });
//                                 }
//                               } on Exception catch (e) {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(
//                                     content: Text('Ошибка определения адреса!'),
//                                   ),
//                                 );
//                               }
//                             },
//                             child: Container(
//                               padding: const EdgeInsets.all(12.0),
//                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
//                               child: Icon(
//                                 Icons.location_on,
//                                 color: Colors.red,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
//                       child: TextField(
//                         textAlign: TextAlign.start,
//                         controller: apartmentController,
//                         decoration: InputDecoration(
//                           hintText: LocaleKeys.apartment.tr(context: context), // Placeholder text
//                           hintStyle: const TextStyle(
//                               color: Colors.grey, // Text color similar to the image
//                               fontSize: 13,
//                               fontWeight: FontWeight.w300,
//                               fontFamily: 'Montserrat'),
//                           border: InputBorder.none, // Remove underline border
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ElevatedButton.icon(
//                           icon: const Icon(Icons.attach_file, color: Colors.black),
//                           // iconAlignment: IconAlignment.start,
//                           label: Text(
//                             LocaleKeys.select_files.tr(context: context),
//                             style: const TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Montserrat', fontSize: 13),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             foregroundColor: Colors.blue.shade900,
//                             backgroundColor: const Color.fromRGBO(225, 166, 17, 1),
//                             minimumSize: const Size(double.infinity, 60),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                           ),
//                           onPressed: () async {
//                             final List<String> supportedImageFormats = ['png', 'jpg', 'jpeg'];

//                             FilePickerResult? result = await FilePicker.platform.pickFiles(
//                               type: FileType.any,
//                             );

//                             if (result != null && result.files.isNotEmpty) {
//                               // Get the selected file
//                               File file = File(result.files.single.path!);

//                               // Get the file type (extension) and file name
//                               String? fileType = result.files.single.extension?.toLowerCase();
//                               String? fileName = result.files.single.name;

//                               // Convert the file to Base64
//                               List<int> fileBytes = await file.readAsBytes();
//                               String fileData = base64Encode(fileBytes);

//                               // Check if the selected file is an image
//                               setState(() {
//                                 reportAttachments.add({
//                                   "file_type": fileType ?? "unknown",
//                                   "file_data": fileData,
//                                 });

//                                 if (supportedImageFormats.contains(fileType)) {
//                                   // Set the reportImage only if the file is an image
//                                   reportImage = {
//                                     "file_type": fileType ?? "unknown",
//                                     "file_data": fileData,
//                                   };
//                                 } else {
//                                   // Set reportImage to null if the file is not an image
//                                   reportImage = null;
//                                 }

//                                 // Set the selected file name to display
//                                 selectedFileName = fileName;
//                               });
//                             } else {
//                               // User canceled the picker
//                               print("No file selected");
//                             }
//                           },
//                         ),

//                         // Display the selected file name
//                         if (selectedFileName != null)
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0),
//                             child: Text(
//                               '${LocaleKeys.loaded_file.tr(context: context)}: $selectedFileName',
//                               style:
//                                   const TextStyle(fontSize: 13, fontWeight: FontWeight.w400, fontFamily: 'Montserrat'),
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: const Color(0xFF003366), // White text color
//                         minimumSize: const Size(double.infinity, 60),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       onPressed: () {
//                         // Check required fields before submission
//                         if (descriptionController.text.isEmpty || selectedDate == null || selectedTime == null) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                                 content: Text(
//                               LocaleKeys.description.tr(context: context),
//                               style: TextStyle(fontFamily: 'Montserrat', fontSize: 13, fontWeight: FontWeight.w400),
//                             )),
//                           );
//                           return;
//                         }
//                         print(selectedFinishedTime);
//                         print(selectedFinishDate);
//                         BlocProvider.of<OpcCreateBloc>(context).add(EditOpc(
//                           widget.id,
//                           opcNameController.text,
//                           int.tryParse(selectedOpsSphere ?? '') ?? 0,
//                           int.tryParse(selectedOpsView ?? '') ?? 0,
//                           int.tryParse(selectedOpsRegion ?? '') ?? 0,
//                           combineDateAndTime(selectedDate, selectedTime) ?? ' ',
//                           descriptionController.text,
//                           numberKuiController.text,
//                           numberErdrController.text,
//                           reportAttachments,
//                           reportImage,
//                           widget.status ?? 1,
//                           city ?? '',
//                           district ?? '',
//                           street ?? '',
//                           house ?? '',
//                           apartmentController.text,
//                           isJournalistRelatedIncident,
//                           isLawEnforcementIncident,
//                           isMilitaryIncident,
//                           isUnderageIncident,
//                           int.tryParse(injuredController.text) ?? 0,
//                           int.tryParse(victimsController.text) ?? 0,
//                           combineDateAndTime(selectedFinishDate, selectedFinishedTime),
//                           countController.text,
//                           selectedStatus,
//                         ));
//                         Navigator.pop(context);
//                       },
//                       child: Text(
//                         LocaleKeys.save.tr(context: context),
//                         style: const TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w300, fontSize: 13, fontFamily: 'Montserrat'),
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     TextButton(
//                       child: Text(LocaleKeys.cancel.tr(context: context),
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'Montserrat',
//                               fontSize: 13)),
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => OpcViewScreen(id: widget.id)));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCheckboxRow({
//     required bool initialValue,
//     required String text,
//     required ValueChanged<bool?> onChanged,
//   }) {
//     return StatefulBuilder(
//       builder: (context, setState) {
//         // Local state for checkbox
//         bool isChecked = initialValue;

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8.0),
//           child: Row(
//             children: [
//               Checkbox(
//                 value: isChecked,
//                 onChanged: (value) {
//                   // Toggle the state
//                   setState(() {
//                     isChecked = value ?? false;
//                     onChanged(isChecked); // Notify the parent
//                   });
//                 },
//               ),
//               Expanded(
//                 child: Text(
//                   text,
//                   style: const TextStyle(fontSize: 13, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class CheckboxRow extends StatefulWidget {
//   final bool initialValue;
//   final String text;
//   final ValueChanged<bool> onChanged;

//   const CheckboxRow({
//     required this.initialValue,
//     required this.text,
//     required this.onChanged,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CheckboxRowState createState() => _CheckboxRowState();
// }

// class _CheckboxRowState extends State<CheckboxRow> {
//   late bool isChecked;

//   @override
//   void initState() {
//     super.initState();
//     isChecked = widget.initialValue;
//   }

//   @override
//   void didUpdateWidget(CheckboxRow oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.initialValue != oldWidget.initialValue) {
//       isChecked = widget.initialValue;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Checkbox(
//             value: isChecked,
//             onChanged: (value) {
//               setState(() {
//                 isChecked = value ?? false;
//               });
//               widget.onChanged(isChecked);
//             },
//           ),
//           Expanded(
//             child: Text(
//               widget.text,
//               style: const TextStyle(fontSize: 13, fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// жане прокурор приложениені под ios настройка жасадым
