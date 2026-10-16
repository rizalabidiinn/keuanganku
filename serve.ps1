$port = 8080
$folder = $PSScriptRoot

# Dapatkan IP Address lokal
$localIP = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Wi-Fi*', 'Ethernet*' -ErrorAction SilentlyContinue | Where-Object { $_.IPAddress -notlike '169.254*' -and $_.IPAddress -notlike '127.*' } | Select-Object -First 1).IPAddress
if (-not $localIP) { $localIP = "localhost" }

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " 🚀 KEUANGANKU iOS WEB SERVER BERJALAN" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "📱 Akses di PC Anda     : http://localhost:$port" -ForegroundColor Yellow
Write-Host "📱 Akses di iPhone Anda : http://$($localIP):$port" -ForegroundColor Yellow
Write-Host "----------------------------------------------------------"
Write-Host "💡 TIPS UNTUK PENGGUNA IPHONE:" -ForegroundColor White
Write-Host " 1. Pastikan iPhone & PC terhubung ke Wi-Fi yang sama."
Write-Host " 2. Buka Safari di iPhone, ketik: http://$($localIP):$port"
Write-Host " 3. Tap tombol Bagikan (Share) -> 'Tambah ke Layar Utama'."
Write-Host " 4. Aplikasi akan terinstall layaknya aplikasi native iOS!"
Write-Host "----------------------------------------------------------"
Write-Host "Tekan CTRL + C di terminal ini untuk mematikan server." -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan

# Buka browser otomatis di PC
Start-Process "http://localhost:$port"

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://*:$port/")
try {
    $listener.Start()
} catch {
    # Jika perlu binding port khusus localhost
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add("http://localhost:$port/")
    $listener.Start()
}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
}

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = $request.Url.LocalPath.TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($urlPath)) {
            $urlPath = "index.html"
        }

        $filePath = Join-Path $folder $urlPath

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = if ($mimeTypes.ContainsKey($ext)) { $mimeTypes[$ext] } else { "application/octet-stream" }
            $response.ContentType = $mime
            
            # CORS headers
            $response.AddHeader("Access-Control-Allow-Origin", "*")

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $bytes.Length
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $errBytes = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found")
            $response.ContentLength64 = $errBytes.Length
            $response.OutputStream.Write($errBytes, 0, $errBytes.Length)
        }
        $response.OutputStream.Close()
    }
} finally {
    $listener.Stop()
    $listener.Close()
}
