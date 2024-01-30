part of 'network_bloc.dart';

abstract class NetworkEvent {}

class NetworkConnectedEvent extends NetworkEvent {}

class NetworkDisconnectedEvent extends NetworkEvent {}
