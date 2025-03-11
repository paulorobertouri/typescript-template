# Demo TypeScript Testing

## Project Setup

To create a new project with Yarn, Vite, React, TypeScript, ESLint, Vitest, and Prettier, follow these steps:

**Initialize the project:**

Execute the following commands:

```sh
# Create a new project
yarn create vite . --template react-ts
```

Add the following dependencies:

```sh
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

## Optional dependencies

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
```

Change a `package.json` file with the following content:

```json
{
  "scripts": {
    "lint": "eslint --fix --ext .ts,tsx --ignore-path .gitignore .",
    "build": "tsc -b && vite build",
    "preview": "vite preview",
    "test": "vitest --run",
    "dev": "vite",
    "format": "prettier -u -w --ignore-path .gitignore \"*.{ts,tsx,css}\""
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
      "preact",
      "plugin:@typescript-eslint/recommended",
      "plugin:prettier/recommended"
    ]
  }
}
```

## How to Use

To run eslint and prettier, execute the following commands:

```sh
yarn lint --fix
yarn format --write '**/*.{ts,tsx,js,jsx,json,css}'
```

To run the project, execute the following command:

```sh
yarn dev
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
