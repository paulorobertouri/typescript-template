# Demo TypeScript Testing

## Project Setup

To create a new project with Yarn, Angular, TypeScript, ESLint and Prettier, follow these steps:

**Initialize the project:**

Execute the following commands:

```sh
# Install Angular CLI
npm install -g @angular/cli@latest

# Windows, enable script execution
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

# Create a new Angular project
ng new angular --skip-install --skip-git --routing --style=css

# Change directory to the project folder
cd angular
```

Add the following dependencies:

```sh
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

# Remove eslint.config.js
Remove-Item eslint.config.js
```

Change a `package.json` file with the following content:

```json
{
  "scripts": {
    ...,
    "lint": "eslint --fix --ext .ts --ignore-path .gitignore .",
    "format": "prettier -u -w --ignore-path .gitignore \"**/*.{ts,css}\""
  },
  "eslintConfig": {
    "ignorePatterns": [
      "build/",
      "node_modules/",
      "dist/",
      ".output/"
    ],
    "parser": "@typescript-eslint/parser",
    "extends": [
      "plugin:@typescript-eslint/recommended",
      "plugin:prettier/recommended",
      "plugin:angular/johnpapa"
    ]
  }
}
```

## How to Use

To run eslint and prettier, execute the following commands:

```sh
yarn lint --fix
yarn format --write '**/*.{ts,js,json,css}'
```

To run the project, execute the following command:

```sh
yarn start
```

To run the tests, execute the following command:

```sh
yarn test
```

To generate a production build, execute the following command:

```sh
yarn build
```

To upgrade the project, execute the following command:

```sh
yarn upgrade-interactive --latest
```
