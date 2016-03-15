gulp       = require 'gulp'
fs         = require 'fs'
path       = require 'path'
sequence   = require 'gulp-sequence'

# tasks
# 编译
gulp.task 'compile', ['jade','jadeToJs','stylus','coffee','cpVender','cpImg']
# 开发模式
gulp.task 'dev', ['jsonlint','compile','proxy','server','watch']
# 上线模式
gulp.task 'dist', 
	sequence 'clean', ['setDist','compile'], 'rMin', 'loder-build', ['server','watch']
# 任务展示
gulp.task 'tasks', [], ()->
	taskslistFile = path.join __dirname, './TASKSLIST'
	console.log fs.readFileSync taskslistFile, {encoding: 'utf8'}
# 默认开发模式dev
gulp.task 'default', ['dev']