import 'package:args/args.dart';

void main(List<String> arguments) {
  final parser = ArgParser();

  // Add subcommands
  final generateCommand = ArgParser()
    ..addOption('name', abbr: 'n', help: 'Name of the file to generate');

  parser.addCommand('generate', generateCommand);
  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Show help');
  parser.addFlag('version', abbr: 'v', negatable: false, help: 'Show version');

  final argResults = parser.parse(arguments);

  if (argResults['help'] == true || arguments.isEmpty) {
    print('autocode-cli - Auto Code CLI');
    print('Usage: autocode-cli <command> [options]');
    print('Commands:');
    print('  generate   Generate a boilerplate file');
    print('  --help     Show help');
    print('  --version  Show version');
    return;
  }

  if (argResults['version'] == true) {
    print('autocode-cli v1.0.0');
    return;
  }

  final command = argResults.command;

  if (command?.name == 'generate') {
    final name = command!['name'] ?? 'default';
    print('🔧 Generating file: $name.dart');
    // Add file generation logic here
  } else {
    print('Unknown command. Use --help for usage.');
  }
}
