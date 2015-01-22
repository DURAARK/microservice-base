/**
 * FileExplorer
 *
 * @description :: Server-side logic for managing files from a given folder
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

var fs = require('fs'),
    path = require('path');

var FileExplorer = module.exports = function(rootPath) {
    this._rootPath = rootPath;
}

FileExplorer.prototype._convertToAbsolutePaths = function(pathStrings) {
    var directories = [],
        files = [];

    for (var idx = 0; idx < pathStrings.length; idx++) {
        var pathString = pathStrings[idx];

        var absPath = path.join(this._rootPath, pathString);

        if (fs.lstatSync(absPath).isDirectory()) {
            directories.push(absPath);
        } else if (fs.lstatSync(absPath).isFile()) {
            files.push(absPath);
        }
    }

    return {
        files: files,
        directories: directories
    }
}

FileExplorer.prototype.getFileList = function(path) {
    if (typeof path === 'undefined') {
        path = this._rootPath;
    }

    var list = this.listFiles(path);

    if (list) {
        return list.files;
    } else {
        return [];
    }
};

FileExplorer.prototype.getDirectoryList = function(path) {
    if (typeof path === 'undefined') {
        path = this._rootPath;
    }

    var list = this.listFiles(path);

    if (list) {
        return list.directories;
    } else {
        return [];
    }
};

FileExplorer.prototype.listFiles = function(path) {
    var files = [],
        directories = [];

    var fileAndFolderList = fs.readdirSync(path);

    if (fileAndFolderList) {
        return this._convertToAbsolutePaths(fileAndFolderList);
    }
}