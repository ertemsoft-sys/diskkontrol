; ErtemSoft Disk Kontrol - Inno Setup kurulum betiği
; Derlemek için: Inno Setup 6 (https://jrsoftware.org/isinfo.php) ile bu dosyayı açıp Compile.
; Önce Delphi'de Win64 / Release derleyin; OpenSSL 1.0.2u 64-bit dll'leri Win64\Release klasöründe olmalı.

#define AppName "Disk Kontrol"
#define AppVersion "1.1.0"
#define AppPublisher "ErtemSoft"
#define AppURL "https://github.com/ertemsoft-sys/diskkontrol"
#define AppExe "diskkontrol.exe"
#define Kaynak "..\Win64\Release"

[Setup]
AppId={{6F1B7C2E-9D4A-4E57-8C1F-3A2D5B6E7F80}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}
DefaultDirName={autopf}\ErtemSoft\Disk Kontrol
DefaultGroupName=ErtemSoft\Disk Kontrol
DisableProgramGroupPage=yes
OutputDir=cikti
OutputBaseFilename=DiskKontrol-{#AppVersion}-kurulum
Compression=lzma2
SolidCompression=yes
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequiredOverridesAllowed=dialog
UninstallDisplayIcon={app}\{#AppExe}
LicenseFile=..\LICENSE
WizardStyle=modern

[Languages]
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"

[Tasks]
Name: "baslangic"; Description: "Windows açılışında arka planda başlat"; GroupDescription: "Ek seçenekler:"
Name: "masaustu"; Description: "Masaüstüne kısayol oluştur"; GroupDescription: "Ek seçenekler:"; Flags: unchecked

[Files]
Source: "{#Kaynak}\{#AppExe}"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Kaynak}\libeay32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#Kaynak}\ssleay32.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\LICENSE"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\UCUNCU-TARAF-LISANSLARI.md"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\README.md"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#AppExe}"
Name: "{group}\{#AppName} Kaldır"; Filename: "{uninstallexe}"
Name: "{autodesktop}\{#AppName}"; Filename: "{app}\{#AppExe}"; Tasks: masaustu

[Registry]
; Programın kendi "Windows Başlangıcına Ekle" düğmesiyle aynı kayıt
Root: HKCU; Subkey: "Software\Microsoft\Windows\CurrentVersion\Run"; ValueType: string; ValueName: "Ertemsoft Disk Kontrol"; ValueData: """{app}\{#AppExe}"" /tray"; Flags: uninsdeletevalue; Tasks: baslangic

[Run]
Filename: "{app}\{#AppExe}"; Description: "{#AppName} programını şimdi çalıştır"; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{sys}\taskkill.exe"; Parameters: "/IM {#AppExe} /F"; Flags: runhidden; RunOnceId: "DiskKontrolKapat"

[UninstallDelete]
Type: filesandordirs; Name: "{localappdata}\ErtemSoft\DiskKontrol"
