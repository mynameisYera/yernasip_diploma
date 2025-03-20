// Бизге новый апп баста деді (Госторганы). мен проекттегі керекті виджеттерді жасадым UI KIT.

// import 'package:flutter/material.dart';

// class CustomButtonWidget extends StatelessWidget {
//   const CustomButtonWidget({
//     super.key,
//     required this.onTap,
//     required this.text,
//     required this.buttonColor,
//     required this.textColor,
//     required this.textStyle,
//   });

//   final VoidCallback onTap;
//   final String text;
//   final Color buttonColor;
//   final Color textColor;
//   final TextStyle textStyle;

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       borderRadius: BorderRadius.circular(25),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(25),
//         onTap: onTap,
//         splashColor: Colors.white.withOpacity(0.3),
//         highlightColor: Colors.white.withOpacity(0.1),
//         child: Container(
//           width: double.infinity,
//           height: 50,
//           decoration: BoxDecoration(
//             color: buttonColor,
//             borderRadius: BorderRadius.circular(25),
//           ),
//           child: Center(
//             child: Text(
//               text,
//               style: textStyle,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:government_mp/features/chat/presentation/pages/chats_page.dart';
// import 'package:government_mp/features/home/presentation/page/home_page.dart';
// import 'package:government_mp/features/profile/presentation/profile_page.dart';
// import 'package:government_mp/features/receptions/presentation/receptions_page.dart';

// class NavBarController extends StatefulWidget {
//   const NavBarController({super.key});

//   @override
//   State<NavBarController> createState() => _NavBarControllerState();
// }

// class _NavBarControllerState extends State<NavBarController> {
//   int _currentIndex = 0;

//   final List<Widget> _pages = [
//     const HomePage(),
//     const ReceptionsPage(),
//     const ChatsPage(),
//     const ProfilePage(),
//   ];

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: CustomNavBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: _currentIndex == 0 ? SvgPicture.asset('assets/icons/svg/home_active.svg') : SvgPicture.asset('assets/icons/svg/home.svg') ,
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: _currentIndex == 1 ? SvgPicture.asset('assets/icons/svg/reception_active.svg') : SvgPicture.asset('assets/icons/svg/reception.svg') ,
//             label: 'Receptions',
//           ),
//           BottomNavigationBarItem(
//             icon: _currentIndex == 2 ? SvgPicture.asset('assets/icons/svg/chat_active.svg') : SvgPicture.asset('assets/icons/svg/chat.svg') ,
//             label: 'Chats',
//           ),
//           BottomNavigationBarItem(
//             icon: _currentIndex == 3 ? SvgPicture.asset('assets/icons/svg/profile_active.svg') : SvgPicture.asset('assets/icons/svg/profile.svg') ,
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//       ),
//     );
//   }
// }

// class CustomNavBar extends StatelessWidget {
//   const CustomNavBar(
//       {super.key,
//       required this.currentIndex,
//       required this.onTap,
//       required this.items});

//   final int currentIndex;
//   final Function(int) onTap;
//   final List<BottomNavigationBarItem> items;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       items: items,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: Theme.of(context).primaryColor,
//       unselectedItemColor: Colors.grey,
//     );
//   }
// }


// жане чат блокты бастадым

// import 'package:flutter/material.dart';
// import 'package:government_mp/core/constants/app_colors.dart';
// import 'package:government_mp/core/widgets/custom_app_bar.dart';
// import 'package:government_mp/core/widgets/custom_textfield_widget.dart';
// import 'package:government_mp/features/chat/presentation/pages/in_chat_page.dart';
// import 'package:government_mp/features/chat/presentation/widgets/chats_item_widget.dart';

// class ChatsPage extends StatefulWidget {
//   const ChatsPage({super.key});

//   @override
//   State<ChatsPage> createState() => _ChatsPageState();
// }

// class _ChatsPageState extends State<ChatsPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {


//     List<Map<String, dynamic>> groups = [
//       {
//         'name': 'Группа 1',
//         'image': 'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
//         'lastMessageSender': 'Yernasip',
//         'lastMessage': 'Последнее сообщение, которое занимает много места',
//         'lastMessageTime': '12:00',
//         'count': 0,
//       },
//       {
//         'name': 'Группа 2',
//         'image': 'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
//         'lastMessageSender': 'Yernasip',
//         'lastMessage': 'Последнее сообщение, которое занимает много места',
//         'lastMessageTime': '12:00',
//         'count': 10,
//       },
//     ];

//     List<Map<String, dynamic>> citizens = [
//       {
//         'name': 'Иван Иванов',
//         'image': 'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
//         'lastMessage': 'Последнее сообщение',
//         'lastMessageTime': '12:00',
//         'lastMessageSender': 'Yernasip',
//         'count': 10,
//       },
//       {
//         'name': 'Мария Петрова',
//         'image': 'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
//         'lastMessage': 'Последнее сообщение',   
//         'lastMessageTime': '12:00',
//         'lastMessageSender': 'Yernasip',
//         'count': 0,
//       },
//     ];

//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       appBar: CustomAppBar(
//         title: 'Мой чат',
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         actions: [
//           InkWell(
//             child: Container(
//               width: 28,
//               height: 28,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: AppColors.primary(context)
//               ),
//               child: Center(child: Icon(Icons.add, size: 20, color: AppColors.white)),
//             ),
//           ),
//           SizedBox(width: 15,)
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Padding(
//             padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10),
//             child: Column(
//               children: [
//                 CustomTextfieldWidget(
//                   hintText: 'Поиск',
//                   borderRadius: 10,
//                   borderColor: AppColors.backgroundColor,
//                   suffixIcon: Icon(
//                     Icons.search,
//                     color: Colors.black.withOpacity(0.2),
//                     size: 28,
//                   ),
//                   controller: TextEditingController(),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                   width: constraints.maxWidth - 100,
//                   child: TabBar(
//                   controller: _tabController,
//                   labelColor: AppColors.primary(context),
//                   unselectedLabelColor: Colors.grey,
//                   indicatorColor: AppColors.primary(context),
//                   tabs: const [
//                     Tab(text: 'Группы'),
//                     Tab(text: 'Чат с гражданами'),
//                   ],
//                 ),
//                 ),
//                   ],
//                 ),
//                 SizedBox(height: 20,),
//                 Expanded(
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       ListView.builder(
//                         itemCount: groups.length,
//                         itemBuilder: (context, index) {
//                           return ChatsItemWidget(group: groups[index], index: index, width: constraints.maxWidth, isGroup: true, onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => InChatPage()));
//                           });
//                         },
//                       ),
//                       ListView.builder(
//                         itemCount: citizens.length,
//                         itemBuilder: (context, index) {
//                           return ChatsItemWidget(group: citizens[index], index: index, width: constraints.maxWidth, isGroup: false, onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => InChatPage()));
//                             print('object');
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:government_mp/core/constants/app_colors.dart';
// import 'package:government_mp/core/widgets/custom_app_bar.dart';

// class InChatPage extends StatefulWidget {
//   const InChatPage({super.key});

//   @override
//   State<InChatPage> createState() => _InChatPageState();
// }

// class _InChatPageState extends State<InChatPage> {
//   final _messageController = TextEditingController();
//   bool _isMessageEmpty = true;

//   @override
//   void initState() {
//     super.initState();
//     _messageController.addListener(_handleTextChange);
//   }

//   @override
//   void dispose() {
//     _messageController.removeListener(_handleTextChange);
//     _messageController.dispose();
//     super.dispose();
//   }

//   void _handleTextChange() {
//     setState(() {
//       _isMessageEmpty = _messageController.text.trim().isEmpty;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Yernasip Duisebay',
//         centerTitle: false,
//         actions: [
//           Icon(Icons.call, color: AppColors.primary(context),),
//           Icon(Icons.video_call, color: AppColors.primary(context), size: 32,),
//           SizedBox(width: 15,),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return  Padding(padding: EdgeInsets.only(right: 18,left: 18, bottom: 10),
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: Text('item'),
//                     ),
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 color: Color(0xffF1F1F1),
//                 child: Row(children: [
//                   SizedBox(width: 10,),
//                   Icon(Icons.attach_file, color: AppColors.primary(context),),
//                   SizedBox(width: 10,),
//                   Expanded(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 10),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(40),
//                       ),
//                       child: TextField(
//                         controller: _messageController,
//                         cursorHeight: 20,
//                         textInputAction: TextInputAction.newline,
//                         decoration: InputDecoration(
//                           hintText: 'Сообщение',
//                           border: InputBorder.none,
//                           constraints: BoxConstraints(
//                             maxHeight: 120,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10,),
//                   Icon(
//                     _isMessageEmpty ? Icons.mic_none : Icons.send,
//                     color: AppColors.primary(context),
//                   ),
//                   SizedBox(width: 10,),
//                 ],),
//               ),
//             ],
//           );
//         },
//       )
//     );
//   }
// }

