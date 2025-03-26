import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/get_post.dart';
import 'package:flutter_application_1/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repository;

  PostBloc(this._repository) : super(PostInitial()) {
    on<GetPostEvent>(_onGetPostEvent);
  }

  Future<void> _onGetPostEvent(GetPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingPostState());
    try {
      final posts = await _repository.getPosts(); // Вызов метода без аргументов
      emit(FetchedPostsState(posts));
    } catch (e) {
      emit(FailurePostState(e.toString()));
    }
  }
}
