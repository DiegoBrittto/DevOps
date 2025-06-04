// ESLint v9+ configuration file
module.exports = [
  {
    files: ["**/*.{js,jsx,ts,tsx}"] ,
    languageOptions: {
      ecmaVersion: 2021,
      sourceType: "module",
    },
    linterOptions: {
      reportUnusedDisableDirectives: true,
    },
    rules: {
      semi: ["error", "always"],
      quotes: ["error", "double"],
      "no-unused-vars": "warn",
      "no-console": "off"
    },
    env: {
      browser: true,
      es2021: true
    },
    extends: ["eslint:recommended"]
  }
];
