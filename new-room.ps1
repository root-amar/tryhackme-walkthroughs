<#
.SYNOPSIS
    Scaffolds a new room directory and standardized walkthrough README for TryHackMe.

.DESCRIPTION
    Creates the required room folder structure, subdirectories for images/scripts, 
    and copies the standardized walkthrough template with pre-filled challenge metadata.

.PARAMETER Room
    Name of the TryHackMe room (e.g., "Pickle Rick", "Blue", "Kenobi").

.PARAMETER Difficulty
    Difficulty level (default: "Medium").

.PARAMETER TargetOS
    Target operating system ("Linux" or "Windows", default: "Linux").

.PARAMETER TargetIP
    Target IP address (default: "10.10.x.x").

.EXAMPLE
    .\new-room.ps1 -Room "Pickle Rick" -Difficulty "Easy" -TargetOS "Linux" -TargetIP "10.10.150.20"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$Room,

    [Parameter(Mandatory = $false)]
    [ValidateSet("Easy", "Easy / Medium", "Medium", "Intermediate", "Hard", "Insane")]
    [string]$Difficulty = "Medium",

    [Parameter(Mandatory = $false)]
    [ValidateSet("Linux", "Windows")]
    [string]$TargetOS = "Linux",

    [Parameter(Mandatory = $false)]
    [string]$TargetIP = "10.10.x.x"
)

$ErrorActionPreference = "Stop"

$rootPath = $PSScriptRoot
$templatePath = Join-Path $rootPath "template.md"

if (-not (Test-Path $templatePath)) {
    Write-Error "Template file not found at: $templatePath"
    exit 1
}

$slugName = $Room.ToLower().Replace(" ", "-")
$roomDir = Join-Path $rootPath $slugName
$imagesDir = Join-Path $roomDir "images"
$scriptsDir = Join-Path $roomDir "scripts"
$targetReadme = Join-Path $roomDir "README.md"

if (Test-Path $targetReadme) {
    Write-Warning "Room README already exists at: $targetReadme"
    $overwrite = Read-Host "Do you want to overwrite it? (y/N)"
    if ($overwrite -ne "y" -and $overwrite -ne "Y") {
        Write-Host "Operation cancelled." -ForegroundColor Yellow
        exit 0
    }
}

# Create folder structure
New-Item -ItemType Directory -Path $imagesDir -Force | Out-Null
New-Item -ItemType Directory -Path $scriptsDir -Force | Out-Null

# Determine badge color
$badgeColor = switch ($Difficulty) {
    "Easy"          { "green" }
    "Easy / Medium" { "yellowgreen" }
    "Medium"        { "orange" }
    "Intermediate"  { "orange" }
    "Hard"          { "red" }
    "Insane"        { "purple" }
    Default         { "blue" }
}

# Read template and substitute variables
$templateContent = Get-Content -Path $templatePath -Raw
$currentDate = (Get-Date).ToString("dd MMMM yyyy")

$walkthroughContent = $templateContent.Replace("[Room Name]", $Room)
$walkthroughContent = $walkthroughContent.Replace("[Difficulty]", $Difficulty)
$walkthroughContent = $walkthroughContent.Replace("[Color]", $badgeColor)
$walkthroughContent = $walkthroughContent.Replace("[Target IP]", $TargetIP)
$walkthroughContent = $walkthroughContent.Replace("[Linux / Windows]", $TargetOS)
$walkthroughContent = $walkthroughContent.Replace("YYYY-MM-DD", $currentDate)

Set-Content -Path $targetReadme -Value $walkthroughContent -Encoding UTF8

Write-Host " Room scaffolded successfully!" -ForegroundColor Green
Write-Host " Target Directory: $roomDir" -ForegroundColor Cyan
Write-Host " Walkthrough File: $targetReadme" -ForegroundColor Cyan
Write-Host " Next Steps:" -ForegroundColor Yellow
Write-Host "  1. Save your sequential screenshots in: $imagesDir"
Write-Host "  2. Save custom exploits/scripts in:     $scriptsDir"
Write-Host "  3. Open and complete your walkthrough:  $targetReadme"
