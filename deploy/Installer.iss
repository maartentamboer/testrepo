// ###########################
#define Release "1.15.0"
// ###########################

#define AppName "cli"
#define Publisher "Maarten Tamboer"

[Setup]
AppPublisher={#Publisher}
AppName=cli
AppId=cli{#Release}
AppVersion={#Release}
WizardStyle=modern
DefaultDirName={localappdata}\MaartenTamboer\cli\
DefaultGroupName={#Publisher}\cli
UninstallDisplayIcon=.\icon_black.ico
UninstallDisplayName=cli {#Release}
Compression=lzma2
SolidCompression=yes
OutputDir=.\setup
OutputBaseFilename=cliSetup
SetupIconFile=.\icon_black.ico
ChangesEnvironment=true

[Tasks]
Name: modifypath; Description: &Add application directory to your system path

[Files]
Source: "../dist/cli/*"; DestDir: {app}; Flags: ignoreversion recursesubdirs


[Code]
const
	ModPathName = 'modifypath';
	ModPathType = 'user';

function ModPathDir(): TArrayOfString;
begin
	setArrayLength(Result, 1)
	Result[0] := ExpandConstant('{app}');
end;
#include "modpath.iss"