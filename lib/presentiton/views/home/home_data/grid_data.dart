// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:provider/provider.dart';

// class GridData {
//   static get gridData {
//     return [
//       {
//         'id': 0,
//         'name': 'Time Record',
//         'images': 'assets/images/time record.png',
//         'route': TimeRecord()
//       },
//       {
//         'id': 1,
//         'name': 'Profile',
//         'images': 'assets/images/Group 71.png',
//         'route': ProfileScreen()
//       },
//       {
//         'id': 2,
//         'name': 'Overtime Request',
//         'images': 'assets/images/overtime.png',
//         'route': OverTimeScreen()
//       },
//       {
//         'id': 3,
//         'name': 'Holiday Request',
//         'images': 'assets/images/holiday.png',
//         'route': HolidayRequestScreen()
//       },
//       {
//         'id': 4,
//         'name': 'Opinion',
//         'images': 'assets/images/opinion.png',
//         'route': OpinionScreen()
//       },
//       {
//         'id': 5,
//         'name': 'Inbox',
//         'images': 'assets/images/inbox.png',
//         'route': const InboxScreen()
//       },
//       {
//         'id': 6,
//         'name': 'Overtime Status',
//         'images': 'assets/images/overtime status.png',
//         'route': const OvertimeStatusScreen()
//       },
//       {
//         'id': 7,
//         'name': 'Holiday Status',
//         'images': 'assets/images/holiday status.png',
//         'route': const HolidayStatusScreen()
//       },
//       {
//         'id': 8,
//         'name': 'Announcements',
//         'images': 'assets/images/announcemets.png',
//         'route': const AnnouncementsScreen()
//       },
//       {
//         'id': 9,
//         'name': 'Official Holiday',
//         'images': 'assets/images/official holiday.png',
//         'route': const OfficialHolidayUser()
//       },
//       {
//         'id': 10,
//         'name': 'Tasks Board',
//         'images': 'assets/images/todo.png',
//         'route': TaskBoardUser()
//       },
//       {
//         'id': 11,
//         'name': 'Prepaid Request',
//         'images': 'assets/images/prepaid.png',
//         'route': PrepaidRequestScreen()
//       },
//       {
//         'id': 12,
//         'name': 'Switch Days',
//         'images': 'assets/images/switch.png',
//         'route': SwitchDaysScreen()
//       },
//     ];
//   }

//   static get gridAdminData {
//     return [
//       {
//         'id': 0,
//         'name': 'Time Record',
//         'images': 'assets/images/time record.png',
//         'route': TimeRecordAdmin()
//       },
//       {
//         'id': 1,
//         'name': 'Users Profile',
//         'images': 'assets/images/Group 71.png',
//         'route':   ProfileScreenAdmin()
//       },
//       {
//         'id': 2,
//         'name': 'OverTime Request',
//         'images': 'assets/images/overtime.png',
//         'route': const OvertimeScreenAdmin()
//       },
//       {
//         'id': 3,
//         'name': 'Holiday Request',
//         'images': 'assets/images/holiday.png',
//         'route': const HolidayRequestScreenAdmin()
//       },
//       {
//         'id': 4,
//         'name': 'View Opinion',
//         'images': 'assets/images/opinion.png',
//         'route': const OpinionScreenAdmin()
//       },
//       {
//         'id': 5,
//         'name': 'Send Inbox',
//         'images': 'assets/images/inbox.png',
//         'route': InboxScreenAdmin()
//       },
//       {
//         'id': 6,
//         'name': 'Announcements',
//         'images': 'assets/images/announcemets.png',
//         'route': AnnouncementsAdminScreen()
//       },
//       {
//         'id': 7,
//         'name': 'Official Holiday',
//         'images': 'assets/images/official holiday.png',
//         'route': const OfficialHoliday()
//       },
//       {
//         'id': 8,
//         'name': 'Add User',
//         'images': 'assets/images/add profile.png',
//         'route': FirstStep()
//       },
//       {
//         'id': 9,
//         'name': 'Tasks Board',
//         'images': 'assets/images/todo.png',
//         'route': TaskBoardAdmin()
//       },
//       {
//         'id': 10,
//         'name': 'Prepaid Request',
//         'images': 'assets/images/prepaid.png',
//         'route': PrepaidRequestAdminScreen()
//       },
//       {
//         'id': 12,
//         'name': 'Switch Days',
//         'images': 'assets/images/switch.png',
//         'route': SwitchDaysAdminScreen()
//       },
//       {
//         'id': 13,
//         'name': 'Reports',
//         'images': 'assets/images/report.png',
//         'route': ChangeNotifierProvider(
//             create: (context) => ReportViewModel(), child: ReportScreen())
//       },
//       {
//         'id': 14,
//         'name': 'Accounting',
//         'images': 'assets/images/Path 260.png',
//         'route': AddFatouraScreen()
//       },
//       // {
//       //   'id': 15,
//       //   'name': 'Hosting&Domain',
//       //   'images': 'assets/images/server.png',
//       //   'route': GetDomainScreen()
//       // },
//     ];
//   }

//   static get griddataAccounter {
//     return [
//       {
//         'id': 0,
//         'name': 'Time Record',
//         'images': 'assets/images/time record.png',
//         'route': TimeRecord()
//       },
//       {
//         'id': 1,
//         'name': 'Profile',
//         'images': 'assets/images/Group 71.png',
//         'route': ProfileScreen()
//       },
//       {
//         'id': 2,
//         'name': 'Overtime Request',
//         'images': 'assets/images/overtime.png',
//         'route': OverTimeScreen()
//       },
//       {
//         'id': 3,
//         'name': 'Holiday Request',
//         'images': 'assets/images/holiday.png',
//         'route': HolidayRequestScreen()
//       },
//       {
//         'id': 4,
//         'name': 'Opinion',
//         'images': 'assets/images/opinion.png',
//         'route': OpinionScreen()
//       },
//       {
//         'id': 5,
//         'name': 'Inbox',
//         'images': 'assets/images/inbox.png',
//         'route': const InboxScreen()
//       },
//       {
//         'id': 6,
//         'name': 'Overtime Status',
//         'images': 'assets/images/overtime status.png',
//         'route': const OvertimeStatusScreen()
//       },
//       {
//         'id': 7,
//         'name': 'Holiday Status',
//         'images': 'assets/images/holiday status.png',
//         'route': const HolidayStatusScreen()
//       },
//       {
//         'id': 8,
//         'name': 'Announcements',
//         'images': 'assets/images/announcemets.png',
//         'route': const AnnouncementsScreen()
//       },
//       {
//         'id': 9,
//         'name': 'Official Holiday',
//         'images': 'assets/images/official holiday.png',
//         'route': const OfficialHolidayUser()
//       },
//       {
//         'id': 10,
//         'name': 'Tasks Board',
//         'images': 'assets/images/todo.png',
//         'route': TaskBoardUser()
//       },
//       {
//         'id': 11,
//         'name': 'Prepaid Request',
//         'images': 'assets/images/prepaid.png',
//         'route': PrepaidRequestScreen()
//       },
//       {
//         'id': 12,
//         'name': 'Switch Days',
//         'images': 'assets/images/switch.png',
//         'route': SwitchDaysScreen()
//       },
//       {
//         'id': 13,
//         'name': 'Accounting',
//         'images': 'assets/images/Path 260.png',
//         'route': AddFatouraScreen()
//       },
//       // {
//       //   'id': 14,
//       //   'name': 'Hosting&Domain',
//       //   'images': 'assets/images/server.png',
//       //   'route': GetDomainScreen()
//       // },
//     ];
//   }
// }
