# About: This script is used to install Angular template

if (Test-Path .\_location.ps1) {
	.\_location.ps1
}

Clear-Host

# Removing the existing project

if (Test-Path angular)
{
	Write-Host "Removing the existing project" -ForegroundColor Green

	Get-ChildItem angular | ForEach-Object {
		Remove-Item -Recurse -Force $_.FullName -ErrorAction SilentlyContinue
	}

	Remove-Item -Recurse -Force angular -ErrorAction SilentlyContinue
}

if (Test-Path angular)
{
	Write-Host "Failed to remove the existing project" -ForegroundColor Red
	exit
}

# Creating a new project

Write-Host "Creating a new project" -ForegroundColor Green

# Install Angular CLI
npm install -g @angular/cli@latest

# Create a new Angular project
ng new angular --skip-install --skip-git --routing --style=css

if (-not (Test-Path angular))
{
	Write-Host "Failed to create Angular project" -ForegroundColor Red
	exit
}

Set-Location angular

# Installing dependencies

Write-Host "Installing dependencies" -ForegroundColor Green
# Node
yarn add ts-node@latest --dev

# Prettier
yarn add prettier@latest @trivago/prettier-plugin-sort-imports@latest --dev

# ESLint
yarn add eslint@^8.0.0 eslint-plugin-prettier@latest eslint-config-prettier@latest eslint-plugin-angular@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest --dev

## Optional dependencies

# Bootstrap
yarn add bootstrap@latest

# Font Awesome
yarn add @fortawesome/fontawesome-free@latest

# Uuid
yarn add uuid@latest

# Marked
yarn add marked@latest

# Changing the package.json file

Write-Host "Changing the package.json file" -ForegroundColor Green

$packageJson = Get-Content package.json -Raw | ConvertFrom-Json

# Add Linting and Formatting scripts
Add-Member -InputObject $packageJson.scripts -MemberType NoteProperty -Name lint -Value "eslint --fix --ext .ts --ignore-path .gitignore ."
Add-Member -InputObject $packageJson.scripts -MemberType NoteProperty -Name format -Value "prettier -u -w --ignore-path .gitignore ""**/*.{ts,css}"""

# Add the eslintConfig
Add-Member -InputObject $packageJson -MemberType NoteProperty -Name eslintConfig -Value @{}

$packageJson.eslintConfig = @{
	"parser" = "@typescript-eslint/parser";
	"extends" = @(
		"preact",
		"plugin:@typescript-eslint/recommended",
		"plugin:prettier/recommended"
	);
	"ignorePatterns" = @("build/", "node_modules/", "dist/", ".output/")
}

$packageJson | ConvertTo-Json -Depth 100 | Set-Content package.json


# Copying files from the ../base-angular directory

Write-Output "Copying files from the ../base-angular directory"

$baseDir = Join-Path (Get-Location).Path '../base-angular'

Get-ChildItem $baseDir | ForEach-Object {
	Copy-Item $_.FullName -Destination . -Recurse -Force
}

# Starting the project

Write-Host "Starting the project" -ForegroundColor Green

yarn

# Running eslint and prettier

Write-Host "Running eslint and prettier" -ForegroundColor Green

yarn lint --fix

yarn format --write '**/*.{ts,tsx,js,jsx,json,css}'

# Running a test

Write-Host "Running a test" -ForegroundColor Green

yarn test

# Running a build

Write-Host "Running a build" -ForegroundColor Green

yarn build
