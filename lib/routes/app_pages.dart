import 'package:flutter/material.dart';
import 'package:popuppros/views/events/approved/approved_event_view.dart';
import 'package:popuppros/views/events/approved/approved_events_viewall.dart';
import 'package:popuppros/views/events/hosting/hosting_events_viewall.dart';
import 'package:popuppros/views/events/invited/invited_event_view.dart';
import 'package:popuppros/views/events/invited/invited_event_viewall.dart';
import 'package:popuppros/views/groups/join_group.dart';
import 'package:popuppros/views/messages/messages_page.dart';
import 'package:popuppros/views/notifications/notifications_page.dart';
import 'package:popuppros/views/profile/host_profile.dart';
import 'package:popuppros/views/profile/vendor_profile.dart';
import 'package:popuppros/views/vendor/browse_vendors.dart';
import 'package:popuppros/views/welcome/welcome_page.dart';
import '../views/auth/signin/signin_page.dart';
import '../views/auth/signup/signup_page.dart';
import '../views/events/create_event_page.dart';
import '../views/events/hosting/hosting_event_view.dart';
import '../views/home_page.dart';
import '../views/profile/edit_profile_page.dart';
import '../views/splash_page.dart';
import '../views/vendor/applied_vendor_view.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = AppRoutes.splashRoute;
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splashRoute: (context) => const SplashPage(),
    AppRoutes.welcomeRoute: (context) => const WelcomePage(),
    AppRoutes.homeRoute: (context) => const HomePage(),
    AppRoutes.signInRoute: (context) => const SignInPage(),
    AppRoutes.signUpRoute: (context) => const SignUpPage(),
    AppRoutes.editProfileRoute: (context) => const EditProfilePage(),
    AppRoutes.eventsHostingAllRoute: (context) => const HostingEventsViewAll(),
    AppRoutes.eventsApprovedAllRoute: (context) => const ApprovedEventsViewAll(),
    AppRoutes.eventsInvitedAllRoute: (context) => const InvitedEventsViewAll(),
    AppRoutes.eventHostingViewRoute: (context) => const HostingEventView(),
    AppRoutes.eventApprovedViewRoute: (context) => const ApprovedEventView(),
    AppRoutes.eventInvitedViewRoute: (context) => const InvitedEventView(),
    AppRoutes.browseVendorsRoute: (context) => const BrowseVendorsPage(),
    AppRoutes.appliedVendorViewRoute: (context) => const AppliedVendorViewPage(),
    AppRoutes.messagesPageRoute: (context) => const MessagesPage(),
    AppRoutes.vendorProfileRoute: (context) => const VendorProfilePage(),
    AppRoutes.hostProfileRoute: (context) => const HostProfilePage(),
    AppRoutes.createEventRoute: (context) => const CreateEventPage(),
    AppRoutes.notificationRoute: (context) => const NotificationsPage(),
    AppRoutes.joinGroupRoute: (context) => const JoinGroupPage(),
  };
}
