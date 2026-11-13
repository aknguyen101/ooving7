$ErrorActionPreference = "Stop"

Write-Host "1/5: Kjører terraform fmt..." -ForegroundColor Cyan
terraform fmt -check -recursive
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "2/5: Kjører terraform init og validate..." -ForegroundColor Cyan
terraform init -backend=false | Out-Null
terraform validate
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "3/5: Kjører TFLint..." -ForegroundColor Cyan
tflint --init
tflint
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "4/5: Kjører Checkov..." -ForegroundColor Cyan
checkov -d . --config-file .checkov.yaml
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "5/5: Kjører terraform test..." -ForegroundColor Cyan
terraform test
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Write-Host "ALLE SJEKKER BESTÅTT!" -ForegroundColor Green
