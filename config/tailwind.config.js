const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        lekton: ['Lekton', 'sans-serif']
      },
    },
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      'primary': '#47d2dc',
      'background': "#f6f7f7",
      'rose': "#f92a82",
      "slateblue": "#826aed",
      "umber":"#635147"
    },

  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
