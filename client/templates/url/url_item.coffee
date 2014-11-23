Template.urlItem.events
  "click .copy": (e) ->
    url = "#{window.location.origin}/#{$(e.target).data('url')}"
    window.prompt("Copy to clipboard: Ctrl+C/Cmd+C, enter", url)

  "click .delete": (e) ->
    e.preventDefault()
    if confirm "Delete this url?"
      Urls.remove $(e.target).data('id')
      Router.go("urlList")
    return
