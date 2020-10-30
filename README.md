# modelgen
A shell script to generate custom model data JSON files for minecraft. It supports all custom item models as of 1.16, including bows, crossbows, clocks, and compasses.

## Dependencies
* Bash Shell
  * If using Windows, consider installing [Linux Bash Shell](https://itsfoss.com/install-bash-on-windows/)
  * If using MacOS, ensure you are using the latest Bash Shell [Upgrading Bash on MacOS](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba)
  * If you do not wish to install Bash, you may use (https://onlinegdb.com/SkBpjBFOD), though this is an external service and there is no guarantee it will remain working.

## Usage
1. Place `modelgen.sh` in the the location you would like to generate the custom model data files.
2. cd to the directory of modelgen.sh.
`cd [PATH_TO_MODELGEN.SH]`
3. Run `modelgen.sh`.
`./modelgen.sh`
4. Follow the prompts of modelgen.sh. To use default values bracketed in yellow, simply leave the prompt blank. Be sure to use the exact vanilla item name for the item name field.
