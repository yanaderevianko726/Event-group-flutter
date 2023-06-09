import 'package:flutter/material.dart';
import 'package:popuppros/views/events/approved/approved_event_view.dart';
import 'package:popuppros/views/events/approved/approved_events_viewall.dart';
import 'package:popuppros/views/events/hosting/hosting_events_viewall.dart';
import 'package:popuppros/views/events/invited/invited_event_view.dart';
import 'package:popuppros/views/events/invited/invited_event_viewall.dart';
import 'package:popuppros/views/messages/messages_page.dart';
import 'package:popuppros/views/notifications/notifications_page.dart';
import 'package:popuppros/views/profile/host_profile.dart';
import 'package:popuppros/views/welcome_page.dart';
import '../views/auth/signin/signin_page.dart';
import '../views/auth/signup/signup_page.dart';
import '../views/events/create_event_page.dart';
import '../views/explore/event_view_page.dart';
import '../views/explore/join_group.dart';
import '../views/home_page.dart';
import '../views/profile/edit_profile_page.dart';
import '../views/splash_page.dart';
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
    AppRoutes.eventHostingViewRoute: (context) => const EventViewPage(),
    AppRoutes.eventApprovedViewRoute: (context) => const ApprovedEventView(),
    AppRoutes.eventInvitedViewRoute: (context) => const InvitedEventView(),
    AppRoutes.messagesPageRoute: (context) => const MessagesPage(),
    AppRoutes.hostProfileRoute: (context) => const HostProfilePage(),
    AppRoutes.createEventRoute: (context) => const CreateEventPage(),
    AppRoutes.notificationRoute: (context) => const NotificationsPage(),
    AppRoutes.joinGroupRoute: (context) => const JoinGroupPage(),
  };
}
