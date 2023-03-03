import 'package:bloc/bloc.dart';
import 'package:medlike/data/repository/images_repository.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState());
 
  Future<String> _getData(String url) {
    return ImagesRepository.getPathImageFile(url: url)
        .then((value) => value)
        .catchError((onError) {
      print('Не удалось загрузить изображение по widget.imageUrl');
      print('Возможно, изображение отсутствует');

      return ('');
    });
  }

  void addUrl(String url) async {
    final value = await _getData(url);
    Map<String, String> values = Map.from(state.imageUrls);
    values[url] = value;
    emit(state.copyWith(
      imageUrls: values
    ));
  }

  void removeUrl(String imageKey) {
    Map<String, String> values = Map.from(state.imageUrls);
    values.remove(imageKey);
    emit(state.copyWith(
      imageUrls: values
    ));
  }
}
