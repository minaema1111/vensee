module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: theme => ({
        'image.10': "url('../img/image.10.jpeg')",
      })
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
