Shell = require 'shell'

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
        Shell.openExternal url
