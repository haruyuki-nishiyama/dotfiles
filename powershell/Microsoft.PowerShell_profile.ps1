# ================================================================
# Prompt (Starship)
# ================================================================

Invoke-Expression (&starship init powershell)

$originalPrompt = $function:prompt

function prompt {
    $cwd  = $PWD.Path -replace '\\', '/'
    $osc7 = "`e]7;file://localhost/$cwd`a"

    Write-Host -NoNewline $osc7
    & $originalPrompt
}

# ================================================================
# Winfetch
# ================================================================

winfetch

