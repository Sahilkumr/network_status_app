part of 'network_bloc.dart';

abstract class NetworkState {}

final class NetworkInitial extends NetworkState {}

final class NetworkConnectedState extends NetworkState {}

final class NetworkDisconnectedState extends NetworkState {}
