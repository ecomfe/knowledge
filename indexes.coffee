fs = require "fs"
path = require "path"
coffee = require "coffee-script"

indexes = {}

# 初始化配置
initSettings = ->
  indexes.app_name = "前端知识体系"

# 初始化知识点
initPoints = ->
  pointPath = "#{__dirname}/data/points"
  indexes.points = getObjectByPath(pointPath)


# 初始化标签
initTags = ->
  tagPath = "#{__dirname}/data/tags"
  indexes.tags = getObjectByPath(tagPath)


# 初始化类别
initCategories = ->
  indexes.categories = {}
  categories = require "#{__dirname}/data/config"
  for category in categories
    if !category.id then continue
    indexes.categories[category.id] = category


# dependance: init
addCategoryTags = ->
  for categoryId, category of indexes.categories
    category.tags = []
    for tagId, tag of indexes.tags
      if categoryId is tag.parent
        category.tags.push tagId

# dependance: addCategoryTags
addTagPoints = ->
  for categoryId, category of indexes.categories
    for pointId, point of indexes.points
      pointTags = point[categoryId]
      if pointTags
        for pointTag in pointTags
          if !indexes.tags[pointTag]
            console.log "#{pointId} 中出现了不存在的Tag: #{pointTag}"
            continue
          if !indexes.tags[pointTag].points
            indexes.tags[pointTag].points = []
          indexes.tags[pointTag].points.push pointId


getObjectCount = (obj) ->
  count = 0
  for key, value of obj
    count++
  count


# 将多个.coffee文件中的Object合并为以Object.id为key的大Object
getObjectByPath= (filePath) ->
  retObj = {}
  files = fs.readdirSync filePath
  for file in files
    if path.extname(file).toLowerCase() is '.coffee'
      filename = "#{filePath}/#{file}"
      try
        str = fs.readFileSync(filename).toString()
        obj = coffee.eval str, sandbox: true
      catch err
        console.error "解析出错：#{filename}"
      if obj.id && obj.id == file.replace('.coffee', '')
        retObj[obj.id] = obj
      else
        console.error "没有id或id与文件名不符：#{filename}"
  return retObj


try
  console.log "为数据建立索引..."
  # init
  initSettings()
  initPoints()
  initTags()
  initCategories()
  # add indexes
  addCategoryTags()
  addTagPoints()
  # init count
  indexes.points_count = getObjectCount indexes.points
  indexes.tags_count = getObjectCount indexes.tags
catch err
  console.error "建立索引出错！"
  throw err


module.exports = indexes
