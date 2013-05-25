$ ->
  haas = new Haas()
  haas.display(1)
  haas.observeKeyEvent()

class Haas
  constructor: ->
    @sections = $("section")
    @page = 1

  display: (page) ->
    pageIndex = page - 1
    location.hash = "#" + page
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
