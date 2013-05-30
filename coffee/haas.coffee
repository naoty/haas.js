###
haas.js
https://github.com/naoty/haas.js
MIT licensed

Copyright (C) 2013 Naoto Kaneko, http://naoty.info
###

$ ->
  haas = new Haas()

  # Display only the page specified at the anchor of URL
  page = Number(location.hash.slice(1))
  page = 1 if page < 1 || page > haas.sections.length
  haas.display(page)

  # Observe key events
  haas.observeKeyEvent()

  # Move to page when browser's go/back event get fired
  $(window).on "popstate", (e) -> location.reload()

class Haas
  constructor: ->
    @sections = $("section")
    @page = 1

  display: (page) ->
    @page = page
    pageIndex = @page - 1
    location.hash = "#" + @page
    @sections.each (index, section) ->
      if index == pageIndex
        $(section).show()
      else
        $(section).hide()

  next: ->
    if @page != @sections.length
      @page++
      this.display(@page)

  prev: ->
    if @page != 1
      @page--
      this.display(@page)

  observeKeyEvent: ->
    self = this
    $(document).keydown (e) ->
      switch e.keyCode
        when 37, 72 then self.prev() # left, h
        when 39, 76 then self.next() # right, l
