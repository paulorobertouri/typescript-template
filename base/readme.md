# Template

## How to Use

### How to Use - PowerShell

To run eslint and prettier, execute the following commands:

```sh
./scripts/windows/format.ps1
```

To test the project, execute the following command:

```sh
./scripts/windows/test.ps1
```

To build the project, execute the following command:

```sh
./scripts/windows/build.ps1
```

### How to Use - Yarn

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
