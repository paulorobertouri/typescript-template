# About: This script is used to build the project

if (Test-Path .\_location.ps1) {
	.\_location.ps1
}

Clear-Host

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
