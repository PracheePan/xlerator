System.config({
    transpiler: 'typescript',
    typescriptOptions: {emitDecoratorMetadata: true},
    map: {
        'app': 'app',
        'rxjs': 'node_modules/rxjs',
        '@angular': 'node_modules/@angular',
        'angular2-in-memory-web-api': 'node_modules/angular2-in-memory-web-api',
        'angular2-cookie': 'node_modules/angular2-cookie'
    },
    packages: {
        'app'                              : {main: 'main.ts', defaultExtension: 'ts'},
        'rxjs'                             : {main: 'index.js'},
        '@angular/common'                  : {main: 'index.js'},
        '@angular/compiler'                : {main: 'index.js'},
        '@angular/core'                    : {main: 'index.js'},
        '@angular/forms'                   : {main: 'index.js'},
        '@angular/http'                    : {main: 'index.js'},
        '@angular/platform-browser'        : {main: 'index.js'},
        '@angular/platform-browser-dynamic': {main: 'index.js'},
        '@angular/router'                  : {main: 'index.js'},
        '@angular/router-deprecated'       : {main: 'index.js'},
        'angular2-in-memory-web-api'       : {main: 'index.js'},
        'angular2-cookie'       		   : {main: 'core.js'}
    }
});