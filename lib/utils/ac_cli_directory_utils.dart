import 'dart:io';
import 'package:ac_extensions/ac_extensions.dart';

class AcCliDirectoryUtils{

  static renameFilesAndDirectoriesCasesInDirectory({required String directoryPath,required updateCase,bool recursive = true}){
    renameDirectoriesCaseInDirectory(directoryPath: directoryPath,updateCase: updateCase,recursive:recursive);
    renameFilesCaseInDirectory(directoryPath: directoryPath, updateCase: updateCase,recursive:recursive);
  }

  static renameDirectoriesCaseInDirectory({required String directoryPath,required updateCase,bool recursive = true}){
    var directory = Directory(directoryPath);
    var entities = directory.listSync(recursive: recursive);
    for(var entity in entities){
      if(entity.isDirectory){
        String currentPath = entity.path.replaceAll("\\", "/");
        String newPath = "${entity.parent.path}/${entity.getName(includeExtension: false).toKebabCase()}".replaceAll("\\", "/");
        print("Renaming directory $currentPath to $newPath...");
        entity.renameSync(newPath);
        print("Renamed directory $currentPath to $newPath");
      }
    }
  }

  static renameFilesCaseInDirectory({required String directoryPath,required updateCase,bool recursive = true}){
    var directory = Directory(directoryPath);
    var entities = directory.listSync(recursive: recursive);
    for(var entity in entities){
      if(entity.isFile){
        String currentPath = entity.path.replaceAll("\\", "/");
        String newPath = "${entity.parent.path}/${entity.getName(includeExtension: false).toKebabCase()}.${entity.getExtension()}".replaceAll("\\", "/");
        print("Renaming file $currentPath to $newPath...");
        entity.renameSync(newPath);
        print("Renamed file $currentPath to $newPath");
      }
    }
  }
}