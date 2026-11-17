# Disk Kontrol

Windows sunucu ve bilgisayarlarda disk doluluğunu izleyen, boş alan belirlediğiniz
seviyenin altına düştüğünde **e-posta ile uyarı gönderen** ücretsiz bir programdır.

ErtemSoft tarafından geliştirilmiştir · <https://www.ertemsoft.net>

## Özellikler

- 5 sürücüye kadar izleme; her sürücü için ayrı uyarı eşiği (GB)
- Ayarlanabilir kontrol aralığı (dakika)
- SMTP ile e-posta uyarısı: **STARTTLS**, **SSL/TLS** veya şifresiz bağlantı, istediğiniz port
- Ayarlar ekranında **Test Maili Gönder** düğmesi
- Aynı sürücü için en fazla 6 saatte bir uyarı (disk dolu kaldıkça mail yağmuru olmaz)
- Bildirim alanında (tepsi) arka planda çalışma, Windows açılışında otomatik başlama
- Mail şifresi Windows'un kendi şifreleme servisiyle (DPAPI) saklanır; düz metin tutulmaz
- Log ekranı ve log dosyaları

## Kurulum

**Kurulum dosyasıyla:** [Releases](https://github.com/ertemsoft-sys/diskkontrol/releases) sayfasından
`DiskKontrol-x.y.z-kurulum.exe` dosyasını indirip çalıştırın.

**Elle:** `diskkontrol.exe`, `libeay32.dll` ve `ssleay32.dll` dosyalarını aynı klasöre koyup
programı çalıştırın. DLL'ler programla aynı bitte (64-bit) olmalıdır.

## Kullanım

1. **Ayarlar** sekmesinde sunucu adını, mail sunucusunu, portu, güvenlik türünü, kullanıcı adını,
   şifreyi ve uyarıların gideceği **Bilgi Maili** adresini girin.
2. İzlenecek sürücüleri ve her biri için **Kontrol GB** (bu değerin altına düşünce uyar) değerini girin.
3. **Test Maili Gönder** ile ayarları deneyin, sonra **Kaydet**.
4. İsterseniz **Windows Başlangıcına Ekle** ile program her açılışta arka planda başlasın.

Pencereyi küçültünce program bildirim alanına iner ve çalışmaya devam eder. Kapatırsanız
diskler kontrol edilmez.

### Mail sunucusu örnekleri

| Sağlayıcı | Mail Server | Port | Güvenlik | Not |
|---|---|---|---|---|
| Gmail | `smtp.gmail.com` | 587 | STARTTLS | Google hesabında 2 adımlı doğrulama açıp **uygulama şifresi** oluşturun; normal şifre çalışmaz. |
| Yandex | `smtp.yandex.com.tr` | 465 | SSL/TLS | Uygulama şifresi gerekebilir. |
| Kendi alan adınız (cPanel/Plesk vb.) | `mail.alanadiniz.com` | 587 veya 465 | STARTTLS / SSL/TLS | Barındırma firmanızın verdiği bilgiler. |
| Microsoft 365 / Outlook | `smtp.office365.com` | 587 | STARTTLS | Microsoft, kullanıcı adı + şifre ile SMTP girişini (Basic Auth) kademeli olarak kapatmaktadır; hesabınızda çalışmayabilir. |

Gönderim başarısız olursa **Log** sekmesinde hatanın sebebi yazar.

## Veriler nerede tutulur?

- **Ayarlar:** `HKEY_CURRENT_USER\SOFTWARE\ERTEMSOFT\ediskkontrol` (şifre DPAPI ile şifreli,
  yalnızca aynı Windows kullanıcısı çözebilir)
- **Loglar:** `%LOCALAPPDATA%\ErtemSoft\DiskKontrol\disklog\`

## Kaynaktan derleme

- Embarcadero Delphi (12 / 13 ile test edildi), VCL, Win64 hedefi
- Ek bileşen gerekmez: Indy Delphi ile birlikte gelir.
- `diskkontrol.dproj` dosyasını açıp **Win64 / Release** olarak derleyin.
- OpenSSL 1.0.2u **64-bit** DLL'lerini
  [IndySockets/OpenSSL-Binaries](https://github.com/IndySockets/OpenSSL-Binaries)
  deposundan (`openssl-1.0.2u-x64_86-win64.zip`) indirip `Win64\Release` klasörüne koyun.
  Win32 derlerseniz `openssl-1.0.2u-i386-win32.zip` içindeki 32-bit DLL'leri kullanın.
- Kurulum dosyası için `kurulum\diskkontrol.iss` betiğini [Inno Setup 6](https://jrsoftware.org/isinfo.php) ile derleyin.

## Lisans

[LICENSE](LICENSE) dosyasına bakın. Üçüncü taraf bileşenler için:
[UCUNCU-TARAF-LISANSLARI.md](UCUNCU-TARAF-LISANSLARI.md).

This product includes software developed by the OpenSSL Project for use in the
OpenSSL Toolkit (<https://www.openssl.org/>).
