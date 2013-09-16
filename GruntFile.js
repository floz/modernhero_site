module.exports = function ( grunt ) {

	var coffeesToWatch = null;
	var filesToWatch = null;	

	grabFilesToWatch();
	initConfig();

	grunt.loadNpmTasks( "grunt-contrib-watch" );
	grunt.loadNpmTasks( 'grunt-contrib-jade' );
	grunt.loadNpmTasks( "grunt-contrib-coffee" );
	grunt.loadNpmTasks( "grunt-contrib-compass" );
	grunt.loadNpmTasks( "grunt-contrib-uglify" );
	grunt.loadNpmTasks( "grunt-contrib-cssmin" );

	grunt.registerTask( "default", "watch" );

	grunt.event.on( "watch", function( action, filepath ) {
		grabFilesToWatch();
		initConfig();
	} );

	function grabFilesToWatch() {
		var baseCoffee = "./src/coffee/";
		coffeesToWatch = [ baseCoffee + "*.coffee" ];
		grunt.file.recurse( baseCoffee, function(abspath, rootdir, subdir, filename) {
			if( subdir == undefined )
				return;
			coffeesToWatch[ coffeesToWatch.length ] = baseCoffee + subdir + "/*.coffee";
		});

		coffeesToWatch.reverse();

		filesToWatch = [ "GruntFile.js", "./src/sass/*.scss", "./src/jade/*.jade" ];
		filesToWatch = filesToWatch.concat( coffeesToWatch );
	}

	function initConfig() {
		grunt.initConfig( {
			pkg: grunt.file.readJSON('package.json'),

			watch: {
				files: filesToWatch,
				tasks: [ "coffee:compile", "compass", "jade:compile" ]
			},

			jade: {
				compile: {
					options: {
						pretty: true,
						data: {
							debug: true
						}
					},
					files: {
						"./deploy/index.html": "./src/jade/index.jade"
					}
				}
			},

			coffee: {
				compile: {
					options: {
						bare: true
					},
					files: {
						"./deploy/js/main.js" : coffeesToWatch
					}
				}
			},

			compass: {
				dist: {
					options: {
						config: "./config.rb"
					}
				}
			},

			uglify: {
				main: {
					options: { 
						beautify: false
					},
					files: {
						"./deploy/js/main.min.js": [ "./deploy/js/vendors/requestAnimationFrame.js", "./deploy/js/vendors/jquery-1.10.2.min.js", "./deploy/js/vendors/greensock/TweenMax.min.js", "./deploy/js/main.js" ]
					}
				}
			},

			cssmin: {
				main: {
					files: {
						"./deploy/css/main.min.css": [ "./deploy/css/reset.css", "./deploy/css/main.css" ]
					}
				}
			}
		});
	}
}