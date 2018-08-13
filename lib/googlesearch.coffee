request = require 'request'

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace', 'smsearch:sm-it': => @search()

  search: ->
    editor = atom.workspace.getActiveTextEditor()
    buffer = editor.getBuffer()
    selections = editor.getSelections()

    buffer.transact ->
      for selection in selections
        cased = selection.getText()
        url = "https://m.sm.cn/s?q=#{cased}"
        request({url: url, headers: {'User-Agent':'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.79 Mobile Safari/537.36'}})
