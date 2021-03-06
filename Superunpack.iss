; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SuperUnpack"
#define MyAppVersion "0.0001"
#define MyAppPublisher "AvatarBlueray"
#define MyAppURL "https://github.com/AvatarBlueray/SuperUnpack"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{70243FF3-333C-49DC-B95B-CBF0E22DA44D}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=setup
SetupIconFile=C:\Users\AvatarBlueray\Desktop\SuperUnpack\SuperUnpack\w7.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Files]
Source: "C:\Users\AvatarBlueray\Desktop\SuperUnpack\SuperUnpack\7z.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\AvatarBlueray\Desktop\SuperUnpack\SuperUnpack\7z.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\AvatarBlueray\Desktop\SuperUnpack\SuperUnpack\Superunpack.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\AvatarBlueray\Desktop\SuperUnpack\SuperUnpack\w7.ico"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system] files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"


[Registry]
                                                         
Root: HKCR; Subkey: ".rar"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".rar\shell"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".rar\shell\SuperUnpack"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".rar\shell\SuperUnpack\command"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".rar\shell\SuperUnpack\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Superunpack.exe"" ""%1"""   ;Flags: uninsdeletevalue
Root: HKCR; Subkey: ".rar\shell\SuperUnpack"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\w7.ico"   ;Flags: uninsdeletevalue

Root: HKCR; Subkey: ".zip"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".zip\shell"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".zip\shell\SuperUnpack"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".zip\shell\SuperUnpack\command"; ValueType: string; ValueName: ""; ValueData: ""   ;Flags: uninsdeletekey
Root: HKCR; Subkey: ".zip\shell\SuperUnpack\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Superunpack.exe"" ""%1"""   ;Flags: uninsdeletevalue
Root: HKCR; Subkey: ".zip\shell\SuperUnpack"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\w7.ico"   ;Flags: uninsdeletevalue
