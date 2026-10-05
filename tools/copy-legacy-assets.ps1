# 從舊版 icarry-vendor-html（Bitbucket）複製 Metronic 靜態資源到 wwwroot/assets。
# Metronic 是 Keenthemes 的商用版型，授權不允許公開散布，所以 assets 不進 GitHub，請在本機執行此腳本。
param(
    [string]$LegacyRoot = (Join-Path $PSScriptRoot '..\..')
)
$source = Join-Path $LegacyRoot 'assets'
$target = Join-Path $PSScriptRoot '..\src\IcarryVendor.Web\wwwroot\assets'
if (-not (Test-Path $source)) { throw "找不到舊版 assets：$source。請用 -LegacyRoot 指定 icarry-vendor-html 的路徑。" }
robocopy $source $target /E /NFL /NDL /NJH /NJS /NP | Out-Null
if ($LASTEXITCODE -ge 8) { throw "robocopy 失敗，代碼 $LASTEXITCODE" }
Write-Host "已複製 assets 到 $target"
