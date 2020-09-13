const path = require('path');
module.exports = {
    entry: {
        main: './front-end/app/app.js',
    },
    output: {
        path: path.join(__dirname, './front-end/app/build'),
        filename: '[name].bundle.js'
    },
    mode: 'development'
}
