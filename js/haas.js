/*
haas.js
https://github.com/naoty/haas.js
MIT licensed

Copyright (C) 2013 Naoto Kaneko, http://naoty.info
*/


(function() {
  var Haas;

  $(function() {
    var haas, page;

    haas = new Haas();
    page = Number(location.hash.slice(1));
    if (page < 1 || page > haas.sections.length) {
      page = 1;
    }
    haas.display(page);
    haas.observeKeyEvent();
    return $(window).on("popstate", function(e) {
      return location.reload();
    });
  });

  Haas = (function() {
    function Haas() {
      this.sections = $("section");
      this.page = 1;
    }

    Haas.prototype.display = function(page) {
      var pageIndex;

      this.page = page;
      pageIndex = this.page - 1;
      location.hash = "#" + this.page;
      return this.sections.each(function(index, section) {
        if (index === pageIndex) {
          return $(section).show();
        } else {
          return $(section).hide();
        }
      });
    };

    Haas.prototype.next = function() {
      if (this.page !== this.sections.length) {
        this.page++;
        return this.display(this.page);
      }
    };

    Haas.prototype.prev = function() {
      if (this.page !== 1) {
        this.page--;
        return this.display(this.page);
      }
    };

    Haas.prototype.observeKeyEvent = function() {
      var self;

      self = this;
      return $(document).keydown(function(e) {
        switch (e.keyCode) {
          case 37:
          case 72:
            return self.prev();
          case 39:
          case 76:
            return self.next();
        }
      });
    };

    return Haas;

  })();

}).call(this);
