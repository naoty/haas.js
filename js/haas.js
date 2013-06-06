/*
haas.js
https://github.com/naoty/haas.js
MIT licensed

Copyright (C) 2013 Naoto Kaneko, http://naoty.info
*/


(function() {
  var Haas;

  $(function() {
    var haas;

    haas = new Haas();
    haas.load();
    haas.observeKeyEvent();
    return $(window).on("popstate", function(e) {
      return haas.reload();
    });
  });

  Haas = (function() {
    function Haas() {
      this.sections = $("section");
      this.initializePage();
    }

    Haas.prototype.initializePage = function() {
      this.page = Number(location.hash.slice(1));
      if (this.page < 1 || this.page > this.sections.length) {
        return this.page = 1;
      }
    };

    Haas.prototype.load = function() {
      var pageIndex;

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

    Haas.prototype.reload = function() {
      this.initializePage();
      return this.load();
    };

    Haas.prototype.next = function() {
      if (this.page !== this.sections.length) {
        this.page++;
        return this.load();
      }
    };

    Haas.prototype.prev = function() {
      if (this.page !== 1) {
        this.page--;
        return this.load();
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
