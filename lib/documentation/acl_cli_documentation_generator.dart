import 'dart:io';
import 'package:ac_documentation/ac_documentation.dart';
import 'package:ac_extensions/ac_extensions.dart';

class AcCliDocumentationGenerator{
  AcDocParser parser = AcDocParser();
  List<String> directoriesToScan = List.empty(growable: true);

  generateHtmlDocumentationForFilesDirectory({required String directoryPath,required String outputPath,bool recursive = true}){
    var directory = Directory(directoryPath);
    var entities = directory.listSync(recursive: recursive);
    final buffer = StringBuffer();
    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html lang="en">');
    buffer.writeln('<head>');
    buffer.writeln('<meta charset="UTF-8">');
    buffer.writeln(
        '<meta name="viewport" content="width=device-width, initial-scale=1.0">');
    buffer.writeln('<title>Documentation</title>');
    buffer.writeln('<style>');
    buffer.writeln(
        'body { font-family: Arial; padding: 2rem; background: #f9f9f9; }');
    buffer.writeln('h2 { margin-top: 2rem; color: #333; }');
    buffer.writeln('h3 { margin-top: 1.5rem; color: #555; }');
    buffer.writeln(
        'section { margin-bottom: 2rem; padding: 1rem; background: white; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }');
    buffer.writeln(
        'pre { background: #eee; padding: 0.5rem; border-radius: 4px; overflow-x: auto; }');
    buffer.writeln('</style>');
    buffer.writeln('</head>');
    buffer.writeln('<body>');
    for(var entity in entities){
      if(entity.isFile){
        print("Checking documentation in file : "+entity.path);
        buffer.write(getDocumentationHtmlStringForFile(filePath: entity.path));
      }
    }
    buffer.writeln('</body>');
    buffer.writeln('</html>');
    File outputFile = File(outputPath);
    if(outputFile.existsSync()){
      outputFile.deleteSync();
    }
    if(!outputFile.parent.existsSync()){
      outputFile.parent.createSync(recursive: true);
    }
    File(outputPath).writeAsStringSync(buffer.toString());
  }

  getDocumentationHtmlStringForFile({required String filePath}){
    String html = "";
    if(File(filePath).existsSync()){
      List<AcDoc> acDocs = AcDocParser.parseFromSource(File(filePath).readAsStringSync());
      html = AcDocHtmlGenerator.generateHtmlString(acDocs: acDocs,generateOnlyBody: true);
    }
    return html;
  }
}