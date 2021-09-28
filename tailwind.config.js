const colors = require('tailwindcss/colors')

module.exports = {
  theme: {
    extend: {
      backgroundImage: theme => ({
         'hero-pattern': "url('/images/image6.jpeg')",
      })
    }
  }
  .
  .
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
  ],
  fontFamily: {
    sans: [
      'Inter var',
      'ui-sans-serif',
      'system-ui',
      '-apple-system',
      'BlinkMacSystemFont',
      '"Segoe UI"',
      'Roboto',
      '"Helvetica Neue"',
      'Arial',
      '"Noto Sans"',
      'sans-serif',
      '"Apple Color Emoji"',
      '"Segoe UI Emoji"',
      '"Segoe UI Symbol"',
      '"Noto Color Emoji"',
    ],
  }
}