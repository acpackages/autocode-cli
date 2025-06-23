import 'package:autocode_cli/autocode_cli.dart' as autocodeCli;
import 'package:test/test.dart';

import 'analyzer/test_analyzer.dart';

void main() async {
  print("Executing Tests");
  var testAnalyzer = TestAnalyzer();
  await testAnalyzer.run();
  // autocodeCli.main(["--help"]);
  // autocodeCli.AcCliDirectoryUtils.renameFilesAndDirectoriesCasesInDirectory(directoryPath: "F:/Packages/AutoCode/Github/autocode-typescript/packages/browser/ac-data-grid/src/lib", updateCase: "");
}
