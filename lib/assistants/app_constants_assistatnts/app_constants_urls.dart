class ConstantsUrl {
  static const String serverURL = _remoteServerConstant;
  static const String newLink='http://senzascent.test-holooltech.com';
  static const String _remoteServerConstant =
      "https://holool-app.test-holooltech.com/api";

  static const String loginUrl = '/admin/gt-users/login-gt-user';

  static const String resetPasswordUrl = '/admin/gt-users/update-password';

  static const String getAllChecks = '/admin/check/get-date-check/';
    
  static const String getAllChecksByMonth =
      '/admin/check/get-user-month-check/';

  static const String getAllInbox = '/admin/messages/get-user-message/';

  static const String getAllAnnouncements =
      '/admin/announcements/get-all-announcement';

  static const String createOpinion = '/admin/opinions/create-opinion';

  static const String createHolidayRequest = '/admin/requests/create-request/';

  static const String createOverTimeRequest =
      '/admin/requests/create-overtime-request';

  static const String checkIn = '/admin/check/check-in/';

  static const String checkOut = '/admin/check/check-out/';
  static const String NewChackOut =
      'https://holool-app.test-holooltech.com/api/admin/check/check-out/';

  static const String getDayStatus = '/admin/gt-users/check-working-day/';

  static const String getHolidays = '/admin/requests/get-user-request/';

  static const String getOverTime =
      '/admin/requests/get-user-overtime-requests/';

  static const String getProfileDetails = '/admin/gt-users/info-user/';

  static const String getAllUsers = '/admin/gt-users/get-all-users-role';

  static const String sendMessage = '/admin/messages/create-message';

  static const String getAllMessage = '/admin/messages/get-all-message';

  static const String createAnnouncements =
      '/admin/announcements/create-announcement';

  static const String getAllOpinion = '/admin/opinions/get-all-opinion';

  static const String getAllHolidays = '/admin/requests/get-all-request';

  static const String changeStatus = '/admin/requests/change-status-request/';

  static const String getAllOvertime =
      '/admin/requests/get-all-overtime-requests';

  static const String changeOvertimeStatus =
      '/admin/requests/change-status-overtime-request/';

  static const String getPound = '/admin/pound/get-pound';

  static const String changePound = '/admin/pound/update-pound';

  static const String createOfficialHoliday =
      '/admin/official-holiday/create-official-holiday';

  static const String getAllOfficialHoliday =
      '/admin/official-holiday/get-all-official-holidays';

  static const String deleteOfficialDay =
      '/admin/official-holiday/delete-official-holiday/';

  static const String createNewUser = '/admin/gt-users/create-new-users';

  static const String getUserStatus = '/admin/check/get-status-rate/';

  static const String activeSalary = '/admin/gt-users/active-salary';

  static const String getSalary = '/admin/gt-users/get-salary/';

  static const String setSalary = '/admin/gt-users/set-salary/';

  static const String updateProfile = '/admin/gt-users/update-user-account/';

  static const String updateToken = '/admin/gt-users/update-user-token/';

  static const String getLastCheckInId = '/admin/check/get-id-to-checkout/';

  static const String getUserToken = '/admin/gt-users/get-user-token/';

  static const String createTodo = '/admin/todos/create-todo';

  static const String getAllTodo = '/admin/todos/get-all-todo';

  static const String hideTasks = '/admin/todos/hide-all-todo';

  static const String getTimeForAdmin = '/admin/gt-users/get-time-for-admin';

  static const String createPrepaid = '/admin/requests/create-advance-request';

  static const String getPrepaid = '/admin/requests/get-user-advance-requests/';

  static const String getPrepaidForAdmin =
      '/admin/requests/get-all-advance-requests';

  static const String deletePrepaid = '/admin/requests/delete-advance-request/';

  static const String deleteHolidayDay =
      '/admin/requests/delete-holiday-request/';

  static const String deleteHolidayHour =
      '/admin/requests/delete-hours-request/';

  static const String deleteOvertime =
      '/admin/requests/delete-overtime-request/';

  static const String deleteAlternate =
      '/admin/requests/delete-alternate-request/';

  static const String createAlternate =
      '/admin/requests/create-alternate-request';

  static const String getAlternateByUser =
      '/admin/requests/get-user-alternate-requests/';

  static const String getAlternateByAdmin =
      '/admin/requests/get-all-alternate-requests';

  static const String changePrepaidStatus =
      '/admin/requests/change-status-advance-request/';

  static const String changeSwitchDayStatus =
      '/admin/requests/change-status-alternate-request/';
}
