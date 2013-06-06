###
haas.js
https://github.com/naoty/haas.js
MIT licensed

Copyright (C) 2013 Naoto Kaneko, http://naoty.info
###

$ ->
  haas = new Haas()
  haas.load()
  haas.observeKeyEvent()

  # Move to page when browser's go/back event get fired
  $(window).on "popstate", (e) -> haas.reload()

class Haas
  constructor: ->
    @sections = $("section")
    this.initializePage()

  initializePage: ->
    @page = Number(location.hash.slice(1))
    @page = 1 if @page < 1 || @page > @sections.length

  # Display only the page specified at the anchor of URL
  load: ->
    pageIndex = @page - 1
    location.hash = "#" + @page
    @sections.each (index, section) ->
      if index == pageIndex
        $(section).show()
      else
        $(section).hide()

  reload: ->
    this.initializePage()
    this.load()

  next: ->
    if @page != @sections.length
      @page++
      this.load()

  prev: ->
    if @page != 1
      @page--
      this.load()

  # Observe key events
  observeKeyEvent: ->
    self = this
    $(document).keydown (e) ->
      switch e.keyCode
        when 37, 72 then self.prev() # left, h
        when 39, 76 then self.next() # right, l
