set PENDULUM_EXTENSIONS=1

maturin build -vv -j %CPU_COUNT% --release --strip --manylinux off --interpreter=%PYTHON%

FOR /F "delims=" %%i IN ('dir /s /b rust\target\wheels\*.whl') DO set pendulum_wheel=%%i

%PYTHON% -m pip install --no-deps %pendulum_wheel% -vv --no-build-isolation
