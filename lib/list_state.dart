class ListState{
  List<Map<String, dynamic>> mData;
  bool isLoading;
  bool isError;
  String errorMsg;

  ListState({required this.mData, this.isLoading = false, this.isError = false, this.errorMsg = ""});
}