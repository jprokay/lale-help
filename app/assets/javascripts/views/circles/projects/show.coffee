ready = ->

  init = ->
    new Lale.TabNav('.project-page .tab-nav', '.project-page .tab')

  init()

$(document).on 'ready', ready
$(document).on 'page:load', ready