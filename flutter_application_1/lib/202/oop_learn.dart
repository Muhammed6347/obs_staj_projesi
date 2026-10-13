import 'dart:io';

import 'package:flutter_application_1/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';


abstract class IFileDownLoad {
  bool? downloadItem(FileItem? fileItem);
  void toShare(String path);
}

    void toShare(String path) async{
     launchUrl(Uri.parse(path));
     }
    


class FileDownload extends IFileDownLoad with ShareMixin{
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('a');
    return true;
  }
  
void smsShare(){}

  @override
  void toShare(String path) {
  }
}

class SmsDownload implements IFileDownLoad{
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();
    print('a');
    return true;
  }
  
void smsShare(){}

  @override
  void toShare(String path) {
  }
}

class FileItem {
  final String name;
  final File file;
  FileItem(this.file, this.name);
}

class VeliDownload {
  
}

mixin ShareMixin on IFileDownLoad{
void toShowFile(params) {
  
}  

}
