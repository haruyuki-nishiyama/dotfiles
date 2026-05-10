#Requires -RunAsAdministrator

# ================================================================
# Helper
# ================================================================

function Link($target, $link) {
    $parentDir = Split-Path $link

    if (!(Test-Path $parentDir)) {
        New-Item -ItemType Directory -Force $parentDir | Out-Null
    }

    if (Test-Path $link) {
        Remove-Item $link -Recurse -Force
    }

    New-Item -ItemType SymbolicLink -Path $link -Target $target | Out-Null
    Write-Host "  linked: $link -> $target" -ForegroundColor Green
}

$dotfiles = "$HOME\dotfiles"

Write-Host "`nCreating symbolic links...`n" -ForegroundColor Cyan

# ================================================================
# WezTerm
# ================================================================

Link "$dotfiles\wezterm" "$HOME\.config\wezterm"

# ================================================================
# Starship
# ================================================================

Link "$dotfiles\starship\starship.toml" "$HOME\.config\starship.toml"

# ================================================================
# Winfetch
# ================================================================

Link "$dotfiles\winfetch\config.ps1" "$HOME\.config\winfetch\config.ps1"

# ================================================================
# Neovim
# ================================================================

Link "$dotfiles\nvim" "$env:LOCALAPPDATA\nvim"

# ================================================================
# PowerShell profile
# ================================================================

Link "$dotfiles\powershell\Microsoft.PowerShell_profile.ps1" $PROFILE

Write-Host "`nDone.`n" -ForegroundColor Cyan

# ================================================================
# Verify
# ================================================================

Write-Host "Verifying links:" -ForegroundColor Yellow

Get-Item "$HOME\.config\wezterm",
         "$HOME\.config\starship.toml",
         "$HOME\.config\winfetch\config.ps1",
         "$env:LOCALAPPDATA\nvim",
         $PROFILE `
| Select-Object Name, LinkType, Target
