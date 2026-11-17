unit diskmainform;

{
  ErtemSoft Disk Kontrol
  Seçilen sürücülerde boþ alan belirlenen seviyenin altýna düþünce
  e-posta ile uyarý gönderir.

  https://github.com/ertemsoft-sys/diskkontrol
}

interface

uses
  Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, registry, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, dateutils, shellapi,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage, IdException,
  IdSSLOpenSSLHeaders;

type
  Tdiskmainformf = class(TForm)
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Timer3: TTimer;
    act: TTrayIcon;
    Timer1: TTimer;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Bevel1: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    IdMessage1: TIdMessage;
    smtp: TIdSMTP;
    SSL1: TIdSSLIOHandlerSocketOpenSSL;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    Label39: TLabel;
    srvkontroltimer: TTimer;
    TabSheet4: TTabSheet;
    Memo2: TMemo;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    BitBtn1: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit11: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Edit12: TEdit;
    ComboBox6: TComboBox;
    BitBtn4: TBitBtn;
    procedure Timer3Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure actDblClick(Sender: TObject);
    function mailgonder(surucu,kapasite,kullanilan,bosalan:String) : String;
    function srvkontrol(surucu,kapasite,kullanilan,bosalan:String) : String;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function dkontrol(tur:Integer) : String;
    procedure srvkontroltimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label41Click(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);

  private
    { Private declarations }
    // Her sürücü harfi için son gönderilen uyarý mailinin zamaný
    FSonMail: array['A'..'Z'] of TDateTime;
    FLogDizin: string;            // log dosyalarýnýn klasörü (kullanýcýnýn AppData klasörü)
    FWindowsKapaniyor: Boolean;   // Windows kapanýrken çýkýþ sorusu sorulmaz
    FEksikAyarUyarildi: Boolean;  // "mail ayarlarý eksik" logu bir kez yazýlýr
    FTepsiBilgisiVerildi: Boolean;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WMQueryEndSession(var Msg: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure WMEndSession(var Msg: TWMEndSession); message WM_ENDSESSION;
    procedure LogYaz(const Satir: string);
    procedure LogKaydet;
    procedure AyarlariOku;
    procedure AyarlariYaz;
    procedure ZamanlayiciAyarla;
    procedure EkranaGetir;
    procedure TepsiyeGizle;
    function MailAyarlariTamam: Boolean;
    function MailGonderIcerik(const Konu: string; Govde: TStrings): string;
    procedure TekDiskKontrol(Surucu: TComboBox; LblAd, LblKapasite, LblKullanilan,
      LblBos: TLabel; Esik: TEdit; tur: Integer);
  public
    { Public declarations }
  end;

var
  diskmainformf: Tdiskmainformf;
  dizin: String;   // exe'nin klasörü (OpenSSL dll'leri burada aranýr)

implementation

{$R *.dfm}

const
  AYAR_ANAHTARI = '\SOFTWARE\ERTEMSOFT\ediskkontrol\';
  BASLANGIC_ANAHTARI = '\SOFTWARE\Microsoft\Windows\CurrentVersion\Run';
  BASLANGIC_DEGERI = 'Ertemsoft Disk Kontrol';

  // Ayný sürücü için en sýk bu kadar saatte bir uyarý maili gönderilir
  MAIL_TEKRAR_SAAT = 6;

  // Log ekranýnda bu kadar satýr birikince dosyaya yazýlýr ve ekran temizlenir
  LOG_SATIR_SINIRI = 1000;

  BIR_GB = Int64(1024) * 1024 * 1024;

{ ---------------------------------------------------------------------------
  Þifre saklama: Windows DPAPI (CryptProtectData)
  Þifre registry'de düz metin deðil, yalnýzca ayný Windows kullanýcýsýnýn
  çözebileceði þekilde þifreli (hex) saklanýr.
  --------------------------------------------------------------------------- }

type
  TVeriBlogu = record
    cbData: DWORD;
    pbData: PByte;
  end;
  PVeriBlogu = ^TVeriBlogu;

const
  CRYPTPROTECT_UI_FORBIDDEN = $1;

function DPAPI_Sifrele(pDataIn: PVeriBlogu; szDataDescr: PWideChar;
  pOptionalEntropy: PVeriBlogu; pvReserved, pPromptStruct: Pointer;
  dwFlags: DWORD; pDataOut: PVeriBlogu): BOOL; stdcall;
  external 'crypt32.dll' name 'CryptProtectData';

function DPAPI_Coz(pDataIn: PVeriBlogu; ppszDataDescr: Pointer;
  pOptionalEntropy: PVeriBlogu; pvReserved, pPromptStruct: Pointer;
  dwFlags: DWORD; pDataOut: PVeriBlogu): BOOL; stdcall;
  external 'crypt32.dll' name 'CryptUnprotectData';

function SifreyiSifrele(const Sifre: string): string;
var
  Bayt: TBytes;
  Giris, Cikis: TVeriBlogu;
  P: PByte;
  i: Integer;
begin
  Result := '';
  if Sifre = '' then
    Exit;
  Bayt := TEncoding.UTF8.GetBytes(Sifre);
  Giris.cbData := Length(Bayt);
  Giris.pbData := @Bayt[0];
  FillChar(Cikis, SizeOf(Cikis), 0);
  if not DPAPI_Sifrele(@Giris, nil, nil, nil, nil, CRYPTPROTECT_UI_FORBIDDEN, @Cikis) then
    RaiseLastOSError;
  try
    P := Cikis.pbData;
    for i := 1 to Integer(Cikis.cbData) do
    begin
      Result := Result + IntToHex(P^, 2);
      Inc(P);
    end;
  finally
    LocalFree(HLOCAL(Cikis.pbData));
  end;
end;

function SifreyiCoz(const Hex: string): string;
var
  Bayt, Acik: TBytes;
  Giris, Cikis: TVeriBlogu;
  i: Integer;
begin
  Result := '';
  if (Hex = '') or Odd(Length(Hex)) then
    Exit;
  SetLength(Bayt, Length(Hex) div 2);
  for i := 0 to High(Bayt) do
    Bayt[i] := Byte(StrToIntDef('$' + Copy(Hex, i * 2 + 1, 2), 0));
  Giris.cbData := Length(Bayt);
  Giris.pbData := @Bayt[0];
  FillChar(Cikis, SizeOf(Cikis), 0);
  // Baþka kullanýcýda / bilgisayarda çözülemez: o zaman þifre boþ gelir, yeniden girilir
  if DPAPI_Coz(@Giris, nil, nil, nil, nil, CRYPTPROTECT_UI_FORBIDDEN, @Cikis) then
  try
    SetLength(Acik, Cikis.cbData);
    if Cikis.cbData > 0 then
      Move(Cikis.pbData^, Acik[0], Cikis.cbData);
    Result := TEncoding.UTF8.GetString(Acik);
  finally
    LocalFree(HLOCAL(Cikis.pbData));
  end;
end;

{ --------------------------------------------------------------------------- }

function BilgisayarAdi: string;
var
  Tampon: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Boyut: Cardinal;
begin
  Boyut := MAX_COMPUTERNAME_LENGTH + 1;
  if Windows.GetComputerName(@Tampon, Boyut) then
    Result := Tampon
  else
    Result := '';
end;

// Güvenlik seçimi (ComboBox6): 0 = STARTTLS, 1 = SSL/TLS, 2 = Yok
function VarsayilanPort(Guvenlik: Integer): Integer;
begin
  case Guvenlik of
    1: Result := 465;
    2: Result := 25;
  else
    Result := 587;
  end;
end;

{ --- Log --------------------------------------------------------------------- }

procedure Tdiskmainformf.LogYaz(const Satir: string);
begin
  Memo1.Lines.Add(Satir);
  if Memo1.Lines.Count > LOG_SATIR_SINIRI then
  begin
    LogKaydet;
    Memo1.Lines.Clear;
    Memo1.Lines.Add('Log :');
  end;
end;

procedure Tdiskmainformf.LogKaydet;
begin
  // Log kaydý hiçbir zaman programý durdurmamalý (izin yok, disk dolu vb.)
  try
    ForceDirectories(FLogDizin);
    Memo1.Lines.SaveToFile(FLogDizin + 'disklog' + FormatDateTime('yyyymmddhhnnss', Now) + '.txt',
                           TEncoding.UTF8);
  except
  end;
end;

{ --- Ayarlar ------------------------------------------------------------------ }

procedure Tdiskmainformf.AyarlariOku;
var
  Reg: TRegistry;
  IlkCalisma: Boolean;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(AYAR_ANAHTARI, True) then
    begin
      Edit1.Text := Reg.ReadString('sunucu');
      Edit2.Text := Reg.ReadString('mserver');
      Edit3.Text := Reg.ReadString('mkullanici');
      Edit5.Text := Reg.ReadString('bmail');

      // Þifre: yeni sürüm þifreli saklar. Eski sürümden kalan düz metin
      // þifre varsa okunur, þifreli olarak yeniden yazýlýr ve düz hali silinir.
      if Reg.ValueExists('msifre_dpapi') then
        Edit4.Text := SifreyiCoz(Reg.ReadString('msifre_dpapi'))
      else
        Edit4.Text := Reg.ReadString('msifre');
      if Reg.ValueExists('msifre') then
      begin
        try
          Reg.WriteString('msifre_dpapi', SifreyiSifrele(Edit4.Text));
          Reg.DeleteValue('msifre');
        except
        end;
      end;

      ComboBox1.Text := Reg.ReadString('disk1');
      ComboBox2.Text := Reg.ReadString('disk2');
      ComboBox3.Text := Reg.ReadString('disk3');
      ComboBox4.Text := Reg.ReadString('disk4');
      ComboBox5.Text := Reg.ReadString('disk5');

      Edit6.Text := Reg.ReadString('kont1');
      Edit7.Text := Reg.ReadString('kont2');
      Edit8.Text := Reg.ReadString('kont3');
      Edit9.Text := Reg.ReadString('kont4');
      Edit10.Text := Reg.ReadString('kont5');
      Edit11.Text := Reg.ReadString('kontsure');

      // Port ve güvenlik: eski kayýtlarda yoksa 587 / STARTTLS
      ComboBox6.ItemIndex := StrToIntDef(Reg.ReadString('mguvenlik'), 0);
      if ComboBox6.ItemIndex < 0 then
        ComboBox6.ItemIndex := 0;
      Edit12.Text := Reg.ReadString('mport');
      if Trim(Edit12.Text) = '' then
        Edit12.Text := IntToStr(VarsayilanPort(ComboBox6.ItemIndex));
    end;
  finally
    Reg.Free;
  end;

  // Ýlk çalýþma: varsayýlan deðerler
  IlkCalisma := Edit1.Text = '';
  if IlkCalisma then
  begin
    Edit1.Text := BilgisayarAdi;
    ComboBox1.Text := 'C:\';
    ComboBox2.Text := 'D:\';
    ComboBox3.Text := 'E:\';
    ComboBox4.Text := 'F:\';
    ComboBox5.Text := 'G:\';
    Edit6.Text := '50';
    Edit7.Text := '50';
    Edit8.Text := '50';
    Edit9.Text := '50';
    Edit10.Text := '50';
    Edit11.Text := '10';
    AyarlariYaz;
  end;
end;

procedure Tdiskmainformf.AyarlariYaz;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(AYAR_ANAHTARI, True) then
    begin
      Reg.WriteString('sunucu', Edit1.Text);
      Reg.WriteString('mserver', Trim(Edit2.Text));
      Reg.WriteString('mkullanici', Trim(Edit3.Text));
      Reg.WriteString('msifre_dpapi', SifreyiSifrele(Edit4.Text));
      if Reg.ValueExists('msifre') then
        Reg.DeleteValue('msifre');
      Reg.WriteString('bmail', Trim(Edit5.Text));
      Reg.WriteString('mport', Edit12.Text);
      Reg.WriteString('mguvenlik', IntToStr(ComboBox6.ItemIndex));
      Reg.WriteString('disk1', ComboBox1.Text);
      Reg.WriteString('disk2', ComboBox2.Text);
      Reg.WriteString('disk3', ComboBox3.Text);
      Reg.WriteString('disk4', ComboBox4.Text);
      Reg.WriteString('disk5', ComboBox5.Text);
      Reg.WriteString('kont1', Edit6.Text);
      Reg.WriteString('kont2', Edit7.Text);
      Reg.WriteString('kont3', Edit8.Text);
      Reg.WriteString('kont4', Edit9.Text);
      Reg.WriteString('kont5', Edit10.Text);
      Reg.WriteString('kontsure', Edit11.Text);
    end;
  finally
    Reg.Free;
  end;
end;

procedure Tdiskmainformf.ZamanlayiciAyarla;
var
  Dakika: Integer;
begin
  // Kontrol süresi dakika; boþ, 0 ya da hatalýysa 10 dakika
  Dakika := StrToIntDef(Trim(Edit11.Text), 10);
  if Dakika < 1 then
    Dakika := 10;
  Timer3.Enabled := False;
  Timer3.Interval := Dakika * 60000;
  Timer3.Enabled := True;
end;

procedure Tdiskmainformf.ComboBox6Change(Sender: TObject);
var
  p: Integer;
begin
  // Port boþsa ya da baþka bir seçeneðin varsayýlan portuysa yeni seçeneðin portunu yaz
  p := StrToIntDef(Trim(Edit12.Text), 0);
  if (p = 0) or (p = 587) or (p = 465) or (p = 25) then
    Edit12.Text := IntToStr(VarsayilanPort(ComboBox6.ItemIndex));
end;

{ --- Mail --------------------------------------------------------------------- }

function Tdiskmainformf.MailAyarlariTamam: Boolean;
begin
  Result := (Trim(Edit2.Text) <> '') and (Trim(Edit3.Text) <> '') and (Trim(Edit5.Text) <> '');
end;

// Formdaki mail ayarlarýyla mail gönderir. Baþarýlýysa '' döner, deðilse hata açýklamasý.
function Tdiskmainformf.MailGonderIcerik(const Konu: string; Govde: TStrings): string;
var
  Mesaj: TIdMessage;
  Port, Guvenlik: Integer;
begin
  Result := '';
  Guvenlik := ComboBox6.ItemIndex;
  if Guvenlik < 0 then
    Guvenlik := 0;
  Port := StrToIntDef(Trim(Edit12.Text), VarsayilanPort(Guvenlik));

  Mesaj := TIdMessage.Create(nil);
  try
    try
      if smtp.Connected then
        smtp.Disconnect;

      smtp.Host := Trim(Edit2.Text);
      case Guvenlik of
        1: begin // SSL/TLS: baðlanýrken doðrudan þifreli (genelde 465)
             smtp.IOHandler := SSL1;
             smtp.UseTLS := utUseImplicitTLS;
           end;
        2: begin // Yok: þifresiz (OpenSSL gerekmez)
             smtp.UseTLS := utNoTLSSupport;
             smtp.IOHandler := nil;
           end;
      else
        begin    // STARTTLS: baðlandýktan sonra þifreli baðlantýya geçer (genelde 587), zorunlu
          smtp.IOHandler := SSL1;
          smtp.UseTLS := utUseRequireTLS;
        end;
      end;
      // Port, UseTLS'ten sonra atanýr (Indy UseTLS deðiþince portu kendisi deðiþtirebiliyor)
      smtp.Port := Port;

      if Guvenlik <> 2 then
      begin
        // OpenSSL dll'leri (libeay32.dll, ssleay32.dll) exe'nin yanýndan yüklenir
        IdOpenSSLSetLibPath(dizin);
        SSL1.SSLOptions.Mode := sslmClient;
        SSL1.SSLOptions.SSLVersions := [sslvTLSv1_2];
      end;
      smtp.AuthType := satDefault;
      smtp.Username := Trim(Edit3.Text);
      smtp.Password := Edit4.Text;
      smtp.ConnectTimeout := 30000;
      smtp.ReadTimeout := 30000;

      Mesaj.CharSet := 'utf-8';
      Mesaj.ContentType := 'text/plain';
      Mesaj.ContentTransferEncoding := 'quoted-printable';
      Mesaj.From.Name := 'Disk Kontrol - ' + Edit1.Text;
      Mesaj.From.Address := Trim(Edit3.Text);
      Mesaj.ReplyTo.EMailAddresses := Trim(Edit3.Text);
      Mesaj.Recipients.EMailAddresses := Trim(Edit5.Text);
      Mesaj.Subject := Konu;
      Mesaj.Body.Assign(Govde);

      smtp.Connect;
      try
        smtp.Authenticate;
        smtp.Send(Mesaj);
      finally
        try
          smtp.Disconnect;
        except
          // baðlantý kapanýrken oluþan hatalar önemsiz
        end;
      end;
    except
      on E: Exception do
      begin
        Result := E.ClassName + ' - ' + E.Message;
        if E is EIdOSSLCouldNotLoadSSLLibrary then
          Result := Result + ' | OpenSSL yüklenemedi, eksik: ' + WhichFailedToLoad() +
                    ' (libeay32.dll ve ssleay32.dll exe ile ayný klasörde ve exe ile ayný bit (32/64) olmalý)';
      end;
    end;
  finally
    Mesaj.Free;
  end;
end;

function Tdiskmainformf.mailgonder(surucu,kapasite,kullanilan,bosalan:String) : String;
var
  Govde: TStringList;
  Harf: Char;
begin
  Result := '';

  if not MailAyarlariTamam then
  begin
    if not FEksikAyarUyarildi then
      LogYaz('Mail ayarlarý eksik (sunucu / kullanýcý / bildirim maili), uyarý maili gönderilemiyor...' + DateTimeToStr(Now));
    FEksikAyarUyarildi := True;
    Exit;
  end;

  // Disk dolu kaldýðý sürece her kontrolde mail atmasýn
  Harf := ' ';
  if surucu <> '' then
    Harf := UpCase(surucu[1]);
  if CharInSet(Harf, ['A'..'Z']) and (FSonMail[Harf] > 0) and
     (HoursBetween(Now, FSonMail[Harf]) < MAIL_TEKRAR_SAAT) then
    Exit;

  Govde := TStringList.Create;
  try
    Govde.Add('Server Adý      : ' + Edit1.Text);
    Govde.Add('Sürücü          : ' + surucu);
    Govde.Add('Disk Kapasite   : ' + kapasite);
    Govde.Add('Disk Kullanýlan : ' + kullanilan);
    Govde.Add('Disk Boþ Alan   : ' + bosalan);
    Govde.Add('Kontrol Zamaný  : ' + DateTimeToStr(Now));
    Govde.Add('');
    Govde.Add('Açýklama : Disk Seviyesi Kritik Seviyede');
    Govde.Add('');
    Govde.Add('Bu Mail Disk Kontrol Programý Tarafýndan Otomatik Olarak Gönderilmektedir. © ErtemSoft');

    Result := MailGonderIcerik('Disk Seviyesi Kritik Seviyede - ' + Edit1.Text + ' ' + surucu, Govde);
  finally
    Govde.Free;
  end;

  if Result = '' then
  begin
    if CharInSet(Harf, ['A'..'Z']) then
      FSonMail[Harf] := Now;
    LogYaz('Mail Gönderildi (' + surucu + ' -> ' + Trim(Edit5.Text) + ')...' + DateTimeToStr(Now));
    Result := 'OK';
  end
  else
  begin
    LogYaz('!!! Hata !!! Mail Gönderilemedi (' + surucu + ')...' + DateTimeToStr(Now));
    LogYaz('    Sebep : ' + Result);
  end;
end;

procedure Tdiskmainformf.BitBtn4Click(Sender: TObject);
var
  Govde: TStringList;
  Hata: string;
begin
  // Test maili: formda yazýlý (henüz kaydedilmemiþ olabilir) ayarlarla gönderir
  if not MailAyarlariTamam then
  begin
    MessageDlg('Önce Mail Server, Kullanýcý ve Bilgi Maili alanlarýný doldurun.', mtWarning, [mbOK], 0);
    Exit;
  end;

  Govde := TStringList.Create;
  Screen.Cursor := crHourGlass;
  try
    Govde.Add('Bu bir test mailidir. Disk Kontrol programýnýn mail ayarlarý çalýþýyor.');
    Govde.Add('');
    Govde.Add('Server Adý      : ' + Edit1.Text);
    Govde.Add('Gönderim Zamaný : ' + DateTimeToStr(Now));
    Hata := MailGonderIcerik('Disk Kontrol - Test Maili (' + Edit1.Text + ')', Govde);
  finally
    Screen.Cursor := crDefault;
    Govde.Free;
  end;

  if Hata = '' then
  begin
    LogYaz('Test Maili Gönderildi (' + Trim(Edit5.Text) + ')...' + DateTimeToStr(Now));
    MessageDlg('Test maili gönderildi: ' + Trim(Edit5.Text), mtInformation, [mbOK], 0);
  end
  else
  begin
    LogYaz('!!! Hata !!! Test Maili Gönderilemedi...' + DateTimeToStr(Now));
    LogYaz('    Sebep : ' + Hata);
    MessageDlg('Test maili gönderilemedi.' + sLineBreak + sLineBreak + Hata, mtError, [mbOK], 0);
  end;
end;

{ --- Disk kontrolü ------------------------------------------------------------ }

function Tdiskmainformf.srvkontrol(surucu,kapasite,kullanilan,bosalan:String) : String;
begin
  Result := '';
  LogYaz('Sürücü Kontrol Edildi : ' + surucu + '  Boþ: ' + bosalan + '...' + DateTimeToStr(Now));
end;

procedure Tdiskmainformf.TekDiskKontrol(Surucu: TComboBox; LblAd, LblKapasite,
  LblKullanilan, LblBos: TLabel; Esik: TEdit; tur: Integer);
var
  Bos, Toplam: Int64;
begin
  LblAd.Caption := Surucu.Text;
  LblKapasite.Caption := '';
  LblKullanilan.Caption := '';
  LblBos.Caption := '';
  if Trim(Surucu.Text) = '' then
    Exit;
  if not GetDiskFreeSpaceEx(PChar(Surucu.Text), Bos, Toplam, nil) then
    Exit;

  LblBos.Caption := IntToStr(Bos div BIR_GB) + ' GB';
  LblKapasite.Caption := IntToStr(Toplam div BIR_GB) + ' GB';
  LblKullanilan.Caption := IntToStr((Toplam - Bos) div BIR_GB) + ' GB';

  // Eþik boþ ya da hatalýysa bu sürücü için uyarý yapýlmaz
  if (Bos div BIR_GB) <= StrToIntDef(Trim(Esik.Text), -1) then
    mailgonder(Surucu.Text, LblKapasite.Caption, LblKullanilan.Caption, LblBos.Caption)
  else if tur = 2 then
    srvkontrol(Surucu.Text, LblKapasite.Caption, LblKullanilan.Caption, LblBos.Caption);
end;

// tur = 1: periyodik kontrol, tur = 2: periyodik kontrol + loga "kontrol edildi" satýrý
function Tdiskmainformf.dkontrol(tur:Integer) : String ;
begin
  Result := '';
  TekDiskKontrol(ComboBox1, Label12, Label17, Label27, Label32, Edit6, tur);
  TekDiskKontrol(ComboBox2, Label13, Label18, Label28, Label33, Edit7, tur);
  TekDiskKontrol(ComboBox3, Label14, Label19, Label29, Label34, Edit8, tur);
  TekDiskKontrol(ComboBox4, Label15, Label20, Label30, Label35, Edit9, tur);
  TekDiskKontrol(ComboBox5, Label16, Label21, Label31, Label36, Edit10, tur);
end;

{ --- Pencere / tepsi ---------------------------------------------------------- }

procedure Tdiskmainformf.EkranaGetir;
begin
  Show;
  WindowState := wsNormal;
  Application.Restore;
  Application.BringToFront;
  SetForegroundWindow(Handle);
end;

procedure Tdiskmainformf.TepsiyeGizle;
begin
  Hide;
  act.Visible := True;
  if not FTepsiBilgisiVerildi then
  begin
    FTepsiBilgisiVerildi := True;
    act.BalloonTitle := 'Disk Kontrol';
    act.BalloonHint := 'Program arka planda çalýþmaya devam ediyor. Açmak için simgeye çift týklayýn.';
    act.ShowBalloonHint;
  end;
end;

procedure Tdiskmainformf.WMSysCommand(var Msg: TWMSysCommand);
begin
  // Küçült düðmesi: görev çubuðu yerine bildirim alanýna (tepsi) iner
  if (Msg.CmdType and $FFF0) = SC_MINIMIZE then
  begin
    TepsiyeGizle;
    Msg.Result := 0;
  end
  else
    inherited;
end;

procedure Tdiskmainformf.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  // Windows kapanýrken / oturum kapanýrken çýkýþ sorusu sorulmaz
  FWindowsKapaniyor := True;
  inherited;
end;

procedure Tdiskmainformf.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession then
    LogKaydet;
  inherited;
end;

procedure Tdiskmainformf.actDblClick(Sender: TObject);
begin
  EkranaGetir;
end;

procedure Tdiskmainformf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FWindowsKapaniyor then
    CanClose := True
  else
    CanClose := Application.MessageBox(PChar('Programdan Çýkmak Ýstiyormusunuz ?' + sLineBreak +
      '(Program kapanýnca diskler kontrol edilmez. Arka planda çalýþmasý için küçültün.)'),
      'Dikkat', MB_YESNO or MB_ICONWARNING) = IDYES;
end;

procedure Tdiskmainformf.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogYaz('Program Kapatýldý : ' + DateTimeToStr(Now));
  LogKaydet;
end;

procedure Tdiskmainformf.FormCreate(Sender: TObject);
var
  AppData: string;
begin
  dizin := ExtractFilePath(ParamStr(0));

  // Loglar kullanýcýnýn AppData klasörüne yazýlýr (Program Files'a yazma izni yoktur)
  AppData := GetEnvironmentVariable('LOCALAPPDATA');
  if AppData <> '' then
    FLogDizin := IncludeTrailingPathDelimiter(AppData) + 'ErtemSoft\DiskKontrol\disklog\'
  else
    FLogDizin := dizin + 'disklog\';
  try
    ForceDirectories(FLogDizin);
  except
  end;

  act.Visible := True;
  LogYaz('Program Çalýþmaya Baþladý : ' + DateTimeToStr(Now));

  AyarlariOku;
  dkontrol(1);
  dkontrol(2);
  ZamanlayiciAyarla;
end;

{ --- Düðmeler ------------------------------------------------------------------ }

procedure Tdiskmainformf.BitBtn1Click(Sender: TObject);
begin
  AyarlariYaz;
  ZamanlayiciAyarla;
  FEksikAyarUyarildi := False;
  LogYaz('Ayarlar Kaydedildi...' + DateTimeToStr(Now));
  dkontrol(1);   // ana ekrandaki disk bilgileri yeni ayarlarla güncellenir
  ShowMessage('Ayarlar Kaydedildi');
end;

procedure Tdiskmainformf.BitBtn2Click(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(BASLANGIC_ANAHTARI, True) then
    begin
      // /tray: Windows açýlýþýnda pencere gösterilmeden bildirim alanýnda baþlar
      Reg.WriteString(BASLANGIC_DEGERI, '"' + ParamStr(0) + '" /tray');
      ShowMessage('Program Windows Baþlangýcýna Eklendi');
    end
    else
      ShowMessage('Windows baþlangýç kaydý açýlamadý.');
  finally
    Reg.Free;
  end;
end;

procedure Tdiskmainformf.BitBtn3Click(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey(BASLANGIC_ANAHTARI, False) and Reg.ValueExists(BASLANGIC_DEGERI) then
      Reg.DeleteValue(BASLANGIC_DEGERI);
  finally
    Reg.Free;
  end;
  ShowMessage('Program Windows Baþlangýcýndan Kaldýrýldý');
end;

procedure Tdiskmainformf.Label41Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(Label41.Caption), nil, nil, SW_SHOWNORMAL);
end;

{ --- Zamanlayýcýlar ------------------------------------------------------------ }

procedure Tdiskmainformf.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Tarih : ' + DateToStr(Date) + '      Saat : ' + TimeToStr(Time);
end;

procedure Tdiskmainformf.srvkontroltimerTimer(Sender: TObject);
begin
  dkontrol(2);
end;

procedure Tdiskmainformf.Timer3Timer(Sender: TObject);
begin
  dkontrol(1);
end;

end.
