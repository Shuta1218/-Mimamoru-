// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mimamoru/main.dart';
// import 'account_setting.dart';
//
// //キー名を書き込む
// // const username = 'name';
// // const watchTarget = 'name';
//
//
// // class Account extends StatefulWidget {
// //   const Account({super.key});
// //
// //   @override
// //   State<Account> createState() => _AccountState();
// // }
// //
// // class _AccountState extends State<Account>{
// //
// //   @override
// //   void initState(){
// //     Future(() async{
// //       final prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       userName = prefs.getString('username')  ?? "ユーザー名の取得に失敗しました";
// //       targetName = prefs.getString('watchTarget') ?? "見守り対象の取得に失敗しました";
// //     });
// //       print(userName);
// //       print(targetName);
// //     });
// //   }
// //
// //   String userName = 'aaaaaaaaaa';
// //   String targetName = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('アカウント'),
// //       ),
// //       body: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Container(
// //                 alignment: Alignment.center,
// //                 child: Column(
// //                   children: [
// //                     Text('ユーザー名',style: TextStyle(fontSize: 32.0)),
// //                     Text(userName,style:TextStyle(fontSize: 25.0)),
// //                   ],
// //                 ),
// //               ),
// //
// //               Container(
// //                 child: Column(
// //                   children: [
// //                     Text('見守り対象',style: TextStyle(fontSize: 32.0)),
// //                     Text(targetName,style:TextStyle(fontSize: 25.0)),
// //                   ],
// //                 ),
// //               ),
// //
// //               Container(
// //                 alignment: Alignment.bottomCenter,
// //                 child: ElevatedButton(
// //                     onPressed: (){
// //                       Navigator.push(
// //                           context,
// //                           MaterialPageRoute(builder: (context) => const AccountSetting()),
// //                       );
// //                     },
// //                     child: const Text('編集')
// //                 ),
// //               ),
// //             ],
// //           )
// //       )
// //     );
// //   }
// // }
//
// class Account extends ConsumerWidget {
//
//   @override
//
//   Widget build(BuildContext context,WidgetRef ref) {
//     final _userName = ref.watch(userNameProvider) ?? "";
//     final _targetName = ref.watch(targetNameProvider) ?? "";
//       return Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             title: const Text('アカウント'),
//           ),
//           body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       children: [
//                         Text('ユーザー名',style: TextStyle(fontSize: 32.0)),
//                         Text(_userName,style:TextStyle(fontSize: 25.0)),
//                       ],
//                     ),
//                   ),
//
//                   Container(
//                     child: Column(
//                       children: [
//                         Text('見守り対象',style: TextStyle(fontSize: 32.0)),
//                         Text(_targetName,style:TextStyle(fontSize: 25.0)),
//                       ],
//                     ),
//                   ),
//
//                   Container(
//                     alignment: Alignment.bottomCenter,
//                     child: ElevatedButton(
//                         onPressed: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const AccountSetting()),
//                           );
//                         },
//                         child: const Text('編集')
//                     ),
//                   ),
//                 ],
//               )
//           )
//       );;
//   }
// }
//
