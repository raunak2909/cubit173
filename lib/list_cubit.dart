import 'package:cubit173/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit() : super(ListState(mData: []));


  /// addNote
  void addNote(Map<String, dynamic> newNote){
    var currData = state.mData;
    currData.add(newNote);
    emit(ListState(mData: currData));
  }

  /// updateNote
  void updateNote(Map<String, dynamic> updateNote, int index){
    var currData = state.mData;
    currData[index] = updateNote;

    emit(ListState(mData: currData));

  }

  /// deleteNote
  void deleteNote(int index){
    var currData = state.mData;
    currData.removeAt(index);

    emit(ListState(mData: currData));
  }


}