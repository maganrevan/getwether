module.exports = function (grunt) {
    require('jit-grunt')(grunt);

    grunt.initConfig({
        less: {
            development: {
                options: {
                    sourceMap: false,
                    compress: false,
                    yuicompress: false,
                    optimization: 2
                },
                files: {
                    "styles/css/styles.css": "styles/less/styles.less" // destination file and source file
                }
            }
        },
        watch: {
            styles: {
                files: ['**/*.less'], // which files to watch
                tasks: ['less'],
                options: {
                    nospawn: true
                }
            }
        }
    });

    grunt.registerTask('default', ['watch']);
};
