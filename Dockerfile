FROM microsoft/windowsservercore:1803
SHELL ["powershell", "-Command"]

# Install Stackless
RUN wget http://www.stackless.com/binaries/python-2.7.15150.amd64-stackless.msi -Outfile C:\stackless.msi
RUN msiexec /qn /passive /norestart /a C:\stackless.msi targetdir=C:\stackless

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install CMake
RUN choco install --yes cmake --installargs 'ADD_CMAKE_TO_PATH=System'

# Install Git
RUN choco install --yes git.install --params "'/GitAndUnixToolsOnPath /NoGitLfs /SChannel /NoAutoCrlf'"
