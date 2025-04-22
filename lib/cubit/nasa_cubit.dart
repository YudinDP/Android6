import 'package:flutter_bloc/flutter_bloc.dart';
import '../requests/api.dart';
class ApodState {}
class ApodLoading extends ApodState {}
class ApodLoaded extends ApodState {
  final List<String> imageUrls;
  ApodLoaded(this.imageUrls);
}
class ApodError extends ApodState {
  final String message;
  ApodError(this.message);
}

class ApodCubit extends Cubit<ApodState> {
  ApodCubit() : super(ApodLoading());

  Future<void> loadImages() async {
    emit(ApodLoading());
    try {
      final urls = await NasaApi.getApodImages(10); 
      emit(ApodLoaded(urls));
    } catch (e) {
      emit(ApodError(e.toString()));
    }
  }
}