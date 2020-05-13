module.exports = {
    'env': {
        'es6': true,
        'node': true,
        'browser': true
    },
    'extends': [
        'airbnb',
        'plugin:react/recommended'
    ],
    'globals': {
        'Atomics': 'readonly',
        'SharedArrayBuffer': 'readonly'
    },
    'parserOptions': {
        'ecmaFeatures': {
            'jsx': true
        },
        'ecmaVersion': 11,
        'sourceType': 'module'
    },
    'plugins': [
        'react'
    ],
    'rules': {
        'import/prefer-default-export': 'off',
        // React specific linting rules for ESLint
        'react/display-name': 1, // Prevent missing displayName in a React component definition
        'jsx-quotes': [2, 'prefer-single'],
        'react/jsx-no-undef': 2, // Disallow undeclared variables in JSX
        'react/jsx-sort-props': 0, // Enforce props alphabetical sorting
        'react/jsx-uses-react': 2, // Prevent React to be incorrectly marked as unused
        'react/jsx-uses-vars': 2, // Prevent variables used in JSX to be incorrectly marked as unused
        'react/no-did-mount-set-state': 2, // Prevent usage of setState in componentDidMount
        'react/no-did-update-set-state': 2, // Prevent usage of setState in componentDidUpdate
        'react/no-multi-comp': 0, // Prevent multiple component definition per file
        'react/no-unknown-property': 2, // Prevent usage of unknown DOM property
        'react/prop-types': 2, // Prevent missing props validation in a React component definition
        'react/react-in-jsx-scope': 2, // Prevent missing React when using JSX
        'react/self-closing-comp': 2, // Prevent extra closing tags for components without children
    }
};
