# About: This script is used to install Vite with react template

if (Test-Path .\_location.ps1) {
	.\_location.ps1
}

Clear-Host

# Removing the existing project

if (Test-Path vite-react)
{
	Write-Host "Removing the existing project" -ForegroundColor Green

	Get-ChildItem vite-react | ForEach-Object {
		Remove-Item -Recurse -Force $_.FullName -ErrorAction SilentlyContinue
	}

	Remove-Item -Recurse -Force vite-react -ErrorAction SilentlyContinue
}

if (Test-Path vite-react)
{
	Write-Host "Failed to remove the existing project" -ForegroundColor Red
	exit
}

# Creating a new project

Write-Host "Creating a new project" -ForegroundColor Green

yarn create vite vite-react --template react-ts

if (-not (Test-Path vite-react))
{
	Write-Host "Failed to create Vite project with react template" -ForegroundColor Red
	exit
}

Set-Location vite-react

# Installing dependencies

Write-Host "Installing dependencies" -ForegroundColor Green

# Node
yarn add ts-node@latest --dev

# Prettier
yarn add prettier@latest @trivago/prettier-plugin-sort-imports@latest --dev

# ESLint
yarn add eslint@^8.0.0 eslint-plugin-prettier@latest eslint-config-prettier@latest eslint-config-react@latest eslint-plugin-react@latest eslint-plugin-react-hooks@latest @typescript-eslint/eslint-plugin@latest @typescript-eslint/parser@latest --dev

# Vitest
yarn add vitest@latest @vitest/coverage-v8 --dev
yarn add jsdom@latest @testing-library/jest-dom@latest @testing-library/jest-dom@latest @testing-library/dom@latest @testing-library/react@latest @testing-library/user-event@latest --dev

# Vite TypeScript Paths
yarn add @types/node@latest path@latest vite-tsconfig-paths@latest --dev

# Installing optional dependencies

Write-Host "Installing optional dependencies" -ForegroundColor Green

# Preact Signals for React
yarn add @preact/signals-react@latest

# React Hook Form
yarn add react-hook-form@latest @hookform/resolvers@latest yup@latest

# Bootstrap
yarn add bootstrap@latest react-bootstrap@latest

# Font Awesome
yarn add @fortawesome/fontawesome-free@latest

# Uuid
yarn add uuid@latest

# Marked
yarn add marked@latest

# Remove eslint.config.js
Remove-Item eslint.config.js

# Changing the package.json file

Write-Host "Changing the package.json file" -ForegroundColor Green

$packageJson = Get-Content package.json -Raw | ConvertFrom-Json

# Add the scripts
$packageJson.scripts = @{}
$packageJson.scripts = @{
	"dev" = "vite";
	"build" = "tsc -b && vite build";
	"preview" = "vite preview";
	"test" = "vitest --run";
	"lint" = "eslint --fix --ext .ts,tsx --ignore-path .gitignore .";
	"format" = "prettier -u -w --ignore-path .gitignore ""*.{ts,tsx,css}"""
}

# Add the eslintConfig
Add-Member -InputObject $packageJson -MemberType NoteProperty -Name eslintConfig -Value @{}

$packageJson.eslintConfig = @{
	"parser" = "@typescript-eslint/parser";
	"extends" = @(
		"plugin:@typescript-eslint/recommended",
		"plugin:react/jsx-runtime",
		"plugin:react-hooks/recommended",
		"plugin:prettier/recommended"
	);
	"ignorePatterns" = @("build/", "node_modules/", "dist/", ".output/")
}

$packageJson | ConvertTo-Json -Depth 100 | Set-Content package.json

# Copying files from the ../base directory

Write-Output "Copying files from the ../base directory"

$baseDir = Join-Path (Get-Location).Path '../base'

Get-ChildItem $baseDir | ForEach-Object {
	Copy-Item $_.FullName -Destination . -Recurse -Force
}

# Copying files from the ../base-vite-react directory

Write-Output "Copying files from the ../base-vite-react directory"

$baseDir = Join-Path (Get-Location).Path '../base-vite-react'

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
