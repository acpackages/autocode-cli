import 'package:autocode_cli/autocode_cli.dart' as autocodeCli;
import 'package:test/test.dart';

import 'analyzer/test_analyzer.dart';
import 'analyzer/test_documentation_generator.dart';

void main() async {
  print("Executing Tests");
  // var testAnalyzer = TestAnalyzer();
  // await testAnalyzer.run();
  var testDocumentationGenerator = TestDocumentationGenerator();
  await testDocumentationGenerator.run();
  // autocodeCli.main(["--help"]);
  // autocodeCli.AcCliDirectoryUtils.renameFilesAndDirectoriesCasesInDirectory(directoryPath: "F:/Packages/AutoCode/Github/autocode-typescript/packages/browser/ac-data-grid/src/lib", updateCase: "");
}
