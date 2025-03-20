// Karma configuration file, see link for more information
// https://karma-runner.github.io/1.0/config/configuration-file.html
module.exports = function (config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine', '@angular-devkit/build-angular'],
    plugins: [
      require('karma-jasmine'),
      require('karma-chrome-launcher'),
      require('karma-jasmine-html-reporter'),
      require('karma-coverage'),
      require('@angular-devkit/build-angular/plugins/karma'),
      require('karma-jsdom-launcher')
    ],
    client: {
      jasmine: {
        // you can add configuration options for Jasmine here
        // the possible options are listed at https://jasmine.github.io/api/edge/Configuration.html
        // for example, you can disable the random execution with `random: false`
        // or set a specific seed with `seed: 4321`
      },
      clearContext: false // leave Jasmine Spec Runner output visible in browser
    },
    jasmineHtmlReporter: {
      suppressAll: true // removes the duplicated traces
    },
    coverageReporter: {
      dir: require('path').join(__dirname, './coverage/my-angular-app'),
      subdir: '.',
      reporters: [
        { type: 'html' },
        { type: 'text-summary' }
      ]
    },
    reporters: ['progress', 'kjhtml'],
    // Utilisez uniquement jsdom pour les tests CI
    browsers: ['jsdom'],
    // Ajoutez ces timeouts
    browserDisconnectTimeout: 60000,
    browserNoActivityTimeout: 60000,
    captureTimeout: 60000,
    // Limitez la concurrence pour éviter les problèmes de ressources
    concurrency: 1,
    // Pour les tests en CI
    singleRun: true,
    autoWatch: false,
    // Supprimez ou désactivez cette option car elle est incompatible avec autoWatch: false
    restartOnFileChange: false,
    // Augmentez le niveau de log pour voir plus de détails
    logLevel: config.LOG_INFO
  });
};