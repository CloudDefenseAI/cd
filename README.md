# CD Scan
Cloud Defense CLI Scanner - A single CLI for scanning and detecting vulnerabilities in any language. Currently supports java, python, php and node.
## Usage

### Main command
```
NAME:
   Cloud Defense CLI Scanner - CLI for scanning and detecting vulnerabilities in any language

USAGE:
   cd-latest-<linux|mac|windows> [global options] command [command options] [arguments...]

COMMANDS:
   scan, s    Scan a given project
   dryrun, d  Dry run of the scan
   help, h    Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --help, -h  show help (default: false)
```
### Sub commands

#### scan
```
NAME:
   cd-latest-<linux|mac|windows> scan - Scan a given project

USAGE:
   cd-latest-<linux|mac|windows> scan [command options] [arguments...]

OPTIONS:
   --lang value, -l value          Language of the project being scanned
   --api-key value, -a value       Api Key for Cloud Defense server
   --path value, -p value          Path to the project or file
   --project-name value, -P value  Name of the project
   --no-versions, -n               Get available next versions (default: false)
   --verbose, -v                   Detailed verbose messages (default: false)
   --help, -h                      show help (default: false)
```
#### dryrun
```
NAME:
   cd-latest-<linux|mac|windows> dryrun - Dry run of the scan

USAGE:
   cd-latest-<linux|mac|windows> dryrun [command options] [arguments...]

OPTIONS:
   --lang value, -l value          Language of the project being scanned
   --path value, -p value          Path to the project
   --project-name value, -P value  Name of the project
   --no-versions, -n               Get available next versions (default: false)
   --verbose, -v                   Detailed verbose messages (default: false)
   --help, -h                      show help (default: false)
```
