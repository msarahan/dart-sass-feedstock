for /f %%i in ('python -c "import subprocess; out = subprocess.check_output(['dart', '--version']); print(out.decode().split()[3])"') do set DART_VERSION=%%i
dart pub get
dart compile exe bin\sass.dart -Dversion=%PKG_VERSION% -Ddart-version=%DART_VERSION% -o %LIBRARY_BIN%\sass.exe
:: dart run grinder pkg-standalone-windows-x64
