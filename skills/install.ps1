# claude-dev-skills installer — Windows PowerShell

param(
    [switch]$Force
)

$SkillsDir = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { "$env:USERPROFILE\.claude\skills" }
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsSrc = Join-Path $ScriptDir "skills"

Write-Host "claude-dev-skills installer"
Write-Host "Installing to: $SkillsDir"
Write-Host ""

New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null

$installed = 0
$skipped = 0

Get-ChildItem -Path $SkillsSrc -Directory | ForEach-Object {
    $skillName = $_.Name
    $dest = Join-Path $SkillsDir $skillName

    if ((Test-Path $dest) -and -not $Force) {
        Write-Host "  ~ $skillName (already exists, skipping — use -Force to overwrite)"
        $skipped++
    } else {
        Copy-Item -Recurse -Force $_.FullName $dest
        Write-Host "  + $skillName"
        $installed++
    }
}

Write-Host ""
Write-Host "Done: $installed installed, $skipped skipped."
Write-Host "Restart Claude Code to load the new skills."
