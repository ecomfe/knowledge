expect = require "expect.js"
path = require "path"
fs = require "fs"
coffee = require "coffee-script"

describe 'Data Format Check', ->
  dataPath = "#{__dirname}/../data"

  it 'Category', ->
    categories = require "#{dataPath}/config"
    for category in categories
      expect(category.id).to.be.a('string')
      expect(category.title).to.be.a('string')
      expect(category.desc).to.be.a('string')
      expect(category.id).not.to.be('')
      expect(category.title).not.to.be('')

  checkDataByPath = (flag, filePath) ->
    retObj = {}
    files = fs.readdirSync filePath
    for file in files
      if path.extname(file).toLowerCase() is '.coffee'
        filename = "#{filePath}/#{file}"
        it "#{flag}: #{filename}", ->
          str = fs.readFileSync(filename).toString()
          obj = coffee.eval str, sandbox: true
          expect(obj).to.be.a('object')
          expect(obj.id).to.be(file.replace('.coffee', ''))

  checkDataByPath 'Tag', "#{dataPath}/tags"
  checkDataByPath 'Point', "#{dataPath}/points"
