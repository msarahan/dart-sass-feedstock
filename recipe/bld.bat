:: would be better to build a native binary, but this seems broken.
:: error looks like this:
::
:: (%PREFIX%) %SRC_DIR%>dart compile exe bin\sass.dart -o %PREFIX%\Library\bin\sass.exe
:: Unhandled exception:
:: Crash when compiling null,
:: at character offset null:
:: Bad state: No element
:: #0      List.single (dart:core-patch/growable_array.dart:353:22)
:: #1      ClassBuilderImpl.buildTypeWithBuiltArguments (package:front_end/src/fasta/builder/class_builder.dart:324:44)
:: #2      ClassBuilderImpl.buildType (package:front_end/src/fasta/builder/class_builder.dart:335:12)

:: may be related to https://github.com/flutter/flutter/issues/92757

:: dart pub get
:: dart compile exe bin\sass.dart -o %LIBRARY_BIN%\sass.exe

sass.bat -v
src\dart.exe -v

@REM ECHO "bld.bat: Renaming rg.exe, see https://github.com/conda-forge/staged-recipes/issues/17519"
@REM SETLOCAL ENABLEEXTENSIONS
@REM IF ERRORLEVEL 1 ECHO "bld.bat: Unable to enable extensions: https://www.robvanderwoude.com/cmdextmsg.php"
@REM IF DEFINED CI (
@REM     IF %CI% NEQ "" (
@REM         move C:\Miniforge\Library\bin\rg.exe C:\Miniconda\Library\bin\rg-desactivate.exe
@REM     ) ELSE (
@REM         ECHO "bld.bat: CI is defined, but empty, so we leave rg.exe as is."
@REM     )
@REM ) ELSE (
@REM     ECHO "bld.bat: We are not in CI, so we leave rg.exe as is."
@REM )


:: Binary repack
mkdir %LIBRARY_BIN%\src
COPY sass.bat %LIBRARY_BIN%
cd src
copy * %LIBRARY_BIN%\src

:: npm does not provide the cli, so it's not an option
:: npm i -g sass@%PKG_VERSION%
