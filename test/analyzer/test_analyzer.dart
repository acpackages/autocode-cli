// import 'package:autocode_cli/analyzer/cli/ac_tree_sitter_cli.dart';
// import 'package:autocode_cli/analyzer/core/ac_analyzer.dart';
// import 'package:autocode_cli/analyzer/core/ac_parser.dart';

import 'package:ac_blueprints/ac_blueprints.dart';

class TestAnalyzer{
  run() async {
    String sourceDirectory = "F:/Packages/AutoCode/Github/autocode-typescript/packages/browser/ac-data-grid/src/lib";
    await getClassListInDirectory(sourceDirectory);
  }

  getClassListInDirectory(String directoryPath) async{
    var codeParser = AcCodeParser();
    await codeParser.parseDirectoryFiles(directoryPath: directoryPath,recursive: true);
    print("\n\n<<< Classes >>>\n\n");
    for(var entity in codeParser.classes){
      print("${entity.name} >>> ${entity.filePath} >>> Line ${entity.lineNumber}");
    }
    print("\n\n<<< Interfaces >>>\n\n");
    for(var entity in codeParser.interfaces){
      print("${entity.name} >>> ${entity.filePath} >>> Line ${entity.lineNumber}");
    }
    // var acParser = AcParser();
    // await acParser.getClassListInDirectory(directoryPath: directoryPath);
  }
}