; Inno Setup configuration for the eturnal TURN server.

; https://github.com/DomGries/InnoDependencyInstaller

#define public Dependency_NoExampleSetup
#include "..\..\InnoDependencyInstaller\CodeDependencies.iss"

[Setup]
AppName=eturnal
AppPublisher=ProcessOne, SARL
AppPublisherURL=https://eturnal.net
AppSupportURL=https://github.com/processone/eturnal/issues
AppVersion=1.8.2
WizardStyle=modern
DefaultDirName={autopf}\eturnal
DefaultGroupName=eturnal
SolidCompression=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
AllowNoIcons=yes
LicenseFile=doc\LICENSE.txt
SourceDir=..\_build\stripped\rel\eturnal
OutputDir=..\..\..\..\windows\installer
SetupIconFile=..\..\..\..\windows\logo.ico

[Files]
Source: *; DestDir: {app}; Flags: createallsubdirs recursesubdirs

[INI]
Filename: {app}\doc\eturnal.url; Section: InternetShortcut; Key: URL; String: https://eturnal.net

[Icons]
Name: {group}\License; Filename: {app}\doc\LICENSE.txt
Name: {group}\Web Site; Filename: {app}\doc\eturnal.url

[Run]
Filename: {app}\bin\eturnal.cmd; Parameters: install; WorkingDir: {app}; Flags: runhidden
Filename: {app}\bin\eturnal.cmd; Parameters: start; WorkingDir: {app}; Flags: runhidden

[UninstallRun]
Filename: {app}\bin\eturnal.cmd; Parameters: stop; WorkingDir: {app}; Flags: runhidden; RunOnceId: StopService
Filename: {app}\bin\eturnal.cmd; Parameters: uninstall; WorkingDir: {app}; Flags: runhidden; RunOnceId: DelService

[UninstallDelete]
Type: files; Name: {app}\doc\eturnal.url

[Code]
procedure InitializeWizard;
begin
  Dependency_InitializeWizard;
end;

function PrepareToInstall(var NeedsRestart: Boolean): String;
begin
  Result := Dependency_PrepareToInstall(NeedsRestart);
end;

function NeedRestart: Boolean;
begin
  Result := Dependency_NeedRestart;
end;

function UpdateReadyMemo(const Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
begin
  Result := Dependency_UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo);
end;

function InitializeSetup: Boolean;
begin
  Dependency_AddVC2015To2019;

  Result := True;
end;
