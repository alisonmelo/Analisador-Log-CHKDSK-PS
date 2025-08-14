#----------------------------------------------------
#         Analisador de Log do CHKDSK v3.0
#   Agora aceita o caminho do arquivo como parâmetro
#----------------------------------------------------

# --- DEFINIÇÃO DE PARÂMETROS ---
# O bloco param() deve ser a PRIMEIRA coisa no script.
# Ele define os "argumentos" que nosso script aceita.
param(
    [Parameter(Mandatory=$true, HelpMessage="Por favor, informe o caminho completo para o arquivo de log. Ex: 'C:\logs\meu_log.txt'")]
    [string]$CaminhoDoArquivo
)

# --- INÍCIO DO SCRIPT ---
Clear-Host

# Verifica se o arquivo realmente existe no caminho informado
if (-not (Test-Path -Path $CaminhoDoArquivo)) {
    Write-Host "ERRO: O arquivo não foi encontrado no caminho especificado: '$CaminhoDoArquivo'." -ForegroundColor Red
    return
}

# Tenta ler o conteúdo do arquivo de log
try {
    $conteudoDoLog = Get-Content -Path $CaminhoDoArquivo -Raw -ErrorAction Stop
}
catch {
    Write-Host "ERRO: Ocorreu um problema ao ler o arquivo '$CaminhoDoArquivo'." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Yellow
    return
}

# --- ANÁLISE E RELATÓRIO (Lógica continua a mesma) ---
# (A lógica de análise que já fizemos continua exatamente a mesma,
#  apenas usamos a variável $CaminhoDoArquivo no relatório)

$resumoFinal = "Não foi possível determinar o resultado. Verifique o log manualmente."
$statusCor = "Red"
$setoresDefeituosos = "Não foi possível encontrar a informação de setores defeituosos."

if ($conteudoDoLog -match "Nao há problemas no sistema de arquivos.") {
    $resumoFinal = "SUCESSO: Nenhum problema encontrado no sistema de arquivos."
    $statusCor = "Green"
}
elseif ($conteudoDoLog -match "O Windows fez correções no sistema de arquivos.") {
    $resumoFinal = "ALERTA: O Windows encontrou e corrigiu erros no sistema de arquivos."
    $statusCor = "Yellow"
}

if ($conteudoDoLog -match "(\d+ KB em setores defeituosos)") {
    $setoresDefeituosos = $matches[0]
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    RELATÓRIO DE ANÁLISE DO CHKDSK"
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Arquivo Analisado: $CaminhoDoArquivo" -ForegroundColor White
Write-Host ""

Write-Host "Status Geral:"
Write-Host "$resumoFinal" -ForegroundColor $statusCor
Write-Host ""

Write-Host "Detalhes de Setores Defeituosos:"
if ($setoresDefeituosos -like "*0 KB*") {
    Write-Host "$setoresDefeituosos" -ForegroundColor Green
}
else {
    Write-Host "$setoresDefeituosos" -ForegroundColor Red
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan