# TypeScripts Templates

This repository contains templates for different types of projects. The templates are written in TypeScript and are intended to be used with the Vite build tool.

## Templates

All templates are written in TypeScript and use Vitest for testing. The templates are intended to be used with the Vite build tool.

### [Vite Preact](./vite-preact.md)

A template for a Preact project using Vite, to create a fast and lightweight web application.

### [Vite React](./vite-react.md)

A template for a React project using Vite, to create a fast and lightweight web application.

### [WXT React](./wxt-react.md)

A template for a React project using WXT, to create a Chrome extension using React.

## Structure

The folders `vite-preact`, `vite-react`, and `wxt-react` contain the actual templates.

The scripts `scripts\windows\install-*.ps1` create a new project with the specified template. The scripts also use folders `base` and `base-*` to copy files to the new project.

I also use the `scripts\windows\install-*.ps1` scripts to create the templates regularly, to ensure that they are up-to-date.

## Libraries

The templates use the following libraries:

- `eslint` for linting
- `prettier` for formatting
- `vitest` for testing
- `vite` for building
