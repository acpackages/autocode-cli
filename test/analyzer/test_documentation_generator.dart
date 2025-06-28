// import 'package:autocode_cli/analyzer/cli/ac_tree_sitter_cli.dart';
// import 'package:autocode_cli/analyzer/core/ac_analyzer.dart';
// import 'package:autocode_cli/analyzer/core/ac_parser.dart';

import 'package:ac_blueprints/ac_blueprints.dart';
import 'package:autocode_cli/autocode_cli.dart';

class TestDocumentationGenerator{
  run() async {
    String sourceDirectory = "F:/Packages/AutoCode/Github/autocode-dart/packages/ac_documentation/lib";
    String outputPath = "F:/Packages/AutoCode/Github/autocode-dart/packages/ac_documentation/docs/documentation.html";
    var documentationGenerator = AcCliDocumentationGenerator();
    documentationGenerator.generateHtmlDocumentationForFilesDirectory(directoryPath: sourceDirectory, outputPath: outputPath,recursive: true);
  }
}