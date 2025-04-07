// // import 'package:flutter/material.dart';
// // import 'package:government_mp/core/constants/app_colors.dart';
// // import 'package:government_mp/core/widgets/custom_app_bar.dart';
// // import 'package:government_mp/core/widgets/custom_textfield_widget.dart';
// // import 'package:government_mp/features/chat/presentation/pages/in_chat_page.dart';
// // import 'package:government_mp/features/chat/presentation/widgets/chats_item_widget.dart';

// // class ChatsPage extends StatefulWidget {
// //   const ChatsPage({super.key});

// //   @override
// //   State<ChatsPage> createState() => _ChatsPageState();
// // }

// // class _ChatsPageState extends State<ChatsPage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     List<Map<String, dynamic>> groups = [
// //       {
// //         'name': 'Группа 1',
// //         'image':
// //             'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
// //         'lastMessageSender': 'Yernasip',
// //         'lastMessage': 'Последнее сообщение, которое занимает много места',
// //         'lastMessageTime': '12:00',
// //         'count': 0,
// //       },
// //       {
// //         'name': 'Группа 2',
// //         'image':
// //             'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
// //         'lastMessageSender': 'Yernasip',
// //         'lastMessage': 'Последнее сообщение, которое занимает много места',
// //         'lastMessageTime': '12:00',
// //         'count': 10,
// //       },
// //     ];

// //     List<Map<String, dynamic>> citizens = [
// //       {
// //         'name': 'Иван Иванов',
// //         'image':
// //             'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
// //         'lastMessage': 'Последнее сообщение',
// //         'lastMessageTime': '12:00',
// //         'lastMessageSender': 'Yernasip',
// //         'count': 10,
// //       },
// //       {
// //         'name': 'Мария Петрова',
// //         'image':
// //             'https://assets.vogue.com/photos/65f04d926294babad5413eb1/16:9/w_5760,h_3240,c_limit/GettyImages-1380534040.jpg',
// //         'lastMessage': 'Последнее сообщение',
// //         'lastMessageTime': '12:00',
// //         'lastMessageSender': 'Yernasip',
// //         'count': 0,
// //       },
// //     ];

// //     return Scaffold(
// //       backgroundColor: AppColors.backgroundColor,
// //       appBar: CustomAppBar(
// //         title: 'Мой чат',
// //         centerTitle: false,
// //         automaticallyImplyLeading: false,
// //         actions: [
// //           InkWell(
// //             child: Container(
// //               width: 28,
// //               height: 28,
// //               decoration: BoxDecoration(
// //                   shape: BoxShape.circle, color: AppColors.primary(context)),
// //               child: Center(
// //                   child: Icon(Icons.add, size: 20, color: AppColors.white)),
// //             ),
// //           ),
// //           SizedBox(
// //             width: 15,
// //           )
// //         ],
// //       ),
// //       body: LayoutBuilder(
// //         builder: (context, constraints) {
// //           return Padding(
// //             padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10),
// //             child: Column(
// //               children: [
// //                 CustomTextfieldWidget(
// //                   hintText: 'Поиск',
// //                   borderRadius: 10,
// //                   borderColor: AppColors.backgroundColor,
// //                   suffixIcon: Icon(
// //                     Icons.search,
// //                     color: Colors.black.withOpacity(0.2),
// //                     size: 28,
// //                   ),
// //                   controller: TextEditingController(),
// //                 ),
// //                 Row(
// //                   children: [
// //                     Container(
// //                       width: constraints.maxWidth - 100,
// //                       child: TabBar(
// //                         controller: _tabController,
// //                         labelColor: AppColors.primary(context),
// //                         unselectedLabelColor: Colors.grey,
// //                         indicatorColor: AppColors.primary(context),
// //                         tabs: const [
// //                           Tab(text: 'Группы'),
// //                           Tab(text: 'Чат с гражданами'),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(
// //                   height: 20,
// //                 ),
// //                 Expanded(
// //                   child: TabBarView(
// //                     controller: _tabController,
// //                     children: [
// //                       ListView.builder(
// //                         itemCount: groups.length,
// //                         itemBuilder: (context, index) {
// //                           return ChatsItemWidget(group: groups[index], index: index, width: constraints.maxWidth, isGroup: true, onTap: () {
// //                             Navigator.push(context, MaterialPageRoute(builder: (context) => InChatPage()));
// //                           });
// //                         },
// //                       ),
// //                       ListView.builder(
// //                         itemCount: citizens.length,
// //                         itemBuilder: (context, index) {
// //                           return ChatsItemWidget(group: citizens[index], index: index, width: constraints.maxWidth, isGroup: false, onTap: () {
// //                             Navigator.push(context, MaterialPageRoute(builder: (context) => InChatPage()));
// //                             print('object');
// //                           });
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:government_mp/core/constants/app_colors.dart';
// import 'package:government_mp/core/widgets/custom_app_bar.dart';
// import 'package:government_mp/features/chat/presentation/widgets/send_button_widget.dart';
// import 'package:government_mp/features/chat/presentation/widgets/sender_message.dart';
// import 'package:government_mp/features/chat/presentation/widgets/user_message.dart';
// import 'package:government_mp/gen/assets.gen.dart';

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

//   List<Map<String, dynamic>> messages = [
//     {
//       'isUser': true,
//       'message': 'Привет, как дела?',
//       'time': '12:00',
//       'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//     },
//     {
//       'isUser': false,
//       'message': 'Привет, все хорошо, а у тебя?',
//       'time': '12:00',
//       'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//     },
//     {
//       'isUser': true,
//       'message': 'Отлично, а у тебя?',
//       'time': '12:00',
//       'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//     },
//     {
//       'isUser': false,
//       'message': 'Привет, все хорошо, а у тебя?',
//       'time': '12:00',
//       'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//     },
//     {
//       'isUser': true,
//       'message': 'Отлично, а у тебя?',
//       'time': '12:00',
//       'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//     },
//   ];

//   void _handleTextChange() {
//     setState(() {
//       _isMessageEmpty = _messageController.text.trim().isEmpty;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
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
//                   itemCount: messages.length,
//                   itemBuilder: (context, index) {
//                     bool isUser = messages[index]['isUser'];
//                     return isUser ? 
//                     UserMessage(message: messages[index]['message'], time: messages[index]['time'], userImage: messages[index]['userImage']) : 
//                     SenderMessage(message: messages[index]['message'], time: messages[index]['time'], userImage: messages[index]['userImage']);
//                   },
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 width: double.infinity,
//                 color: Color(0xffF1F1F1),
//                 child: Row(children: [
//                   SizedBox(width: 20,),
//                   GestureDetector(onTap: (){

//                   } ,child: SvgPicture.asset(Assets.icons.svg.attach.path)),
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
//                   _isMessageEmpty ? SizedBox(width: 10,) : SizedBox(width: 5,),
//                   _isMessageEmpty ? GestureDetector(child: SvgPicture.asset(Assets.icons.svg.mic.path)) : SendButtonWidget(onTap: () {
//                     if (_messageController.text.trim().isEmpty) {
//                       return;
//                     }
//                     setState(() {
//                       messages.add({
//                         'isUser': true,
//                         'message': _messageController.text.trim(),
//                         'time': '12:00',
//                         'userImage': 'https://cdn-prd.content.metamorphosis.com/wp-content/uploads/sites/6/2022/12/shutterstock_781327003-1-768x512.jpg'
//                       });
//                       _messageController.clear();
//                     },);
//                   },),
//                   _isMessageEmpty ? SizedBox(width: 20) : SizedBox(width: 10,),
//                 ],),
//               ),
//             ],
//           );
//         },
//       )
//     );
//   }
// }