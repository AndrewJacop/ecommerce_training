abstract class ProfileState {}

class ProfileInitState extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadingSuccess extends ProfileState {}

class ProfileLoadingError extends ProfileState {}

class ProfileUpdateSuccess extends ProfileState {}

class ProfileUpdateError extends ProfileState {}
