abstract class AppRoutes {
  static const splashRoute = Paths.splashPath;
  static const welcomeRoute = Paths.welcomePath;
  static const homeRoute = Paths.homePath;
  static const signInRoute = Paths.getSignInPage;
  static const signUpRoute = Paths.getSignUpPage;
  static const editProfileRoute = Paths.editProfilePath;
  static const eventsHostingAllRoute = Paths.eventsHostingAllPath;
  static const eventsApprovedAllRoute = Paths.eventsApprovedAllPath;
  static const eventsInvitedAllRoute = Paths.eventsInvitedAllPath;
  static const eventHostingViewRoute = Paths.eventHostingViewPath;
  static const eventApprovedViewRoute = Paths.eventApprovedViewPath;
  static const eventInvitedViewRoute = Paths.eventInvitedViewPath;
  static const browseVendorsRoute = Paths.browseVendorsPath;
  static const appliedVendorViewRoute = Paths.appliedVendorViewPath;
  static const messagesPageRoute = Paths.messagesPagePath;
  static const hostProfileRoute = Paths.hostProfilePath;
  static const createEventRoute = Paths.createEventPath;
  static const notificationRoute = Paths.notificationPath;
  static const joinGroupRoute = Paths.joinGroupPath;
}

abstract class Paths {
  static const splashPath = "/";
  static const welcomePath = "/welcomePage";
  static const homePath = "/homePage";
  static const getSignInPage = "/SignInPage";
  static const getSignUpPage = "/SignUpPage";
  static const editProfilePath = "/EditProfile";
  static const eventsHostingAllPath = "/EventsHostingViewAll";
  static const eventsApprovedAllPath = "/EventsApprovedViewAll";
  static const eventsInvitedAllPath = "/EventsInvitedViewAll";
  static const eventHostingViewPath = "/EventHostingView";
  static const eventApprovedViewPath = "/EventApprovedView";
  static const eventInvitedViewPath = "/EventInvitedView";
  static const browseVendorsPath = "/BrowseVendors";
  static const appliedVendorViewPath = "/AppliedVendorView";
  static const messagesPagePath = "/MessagesPage";
  static const hostProfilePath = "/HostProfilePage";
  static const createEventPath = "/CreateEventPage";
  static const notificationPath = "/NotificationPage";
  static const joinGroupPath = "/JoinGroupPage";
}
