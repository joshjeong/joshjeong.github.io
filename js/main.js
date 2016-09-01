// Simple JavaScript Templating
  // John Resig - http://ejohn.org/ - MIT Licensed
  var images = {};
  var index = 0;

  Array.prototype.move = function (old_index, new_index) {
    while (old_index < 0) {
        old_index += this.length;
    }
    while (new_index < 0) {
        new_index += this.length;
    }
    if (new_index >= this.length) {
        var k = new_index - this.length;
        while ((k--) + 1) {
            this.push(undefined);
        }
    }
    this.splice(new_index, 0, this.splice(old_index, 1)[0]);
    return this; // for testing purposes
};

  (function(){
    var cache = {};

    this.tmpl = function tmpl(str, data) {
      // Figure out if we're getting a template, or if we need to
      // load the template - and be sure to cache the result.
      var fn = !/\W/.test(str) ?
        cache[str] = cache[str] ||
          tmpl(document.getElementById(str).innerHTML) :

        // Generate a reusable function that will serve as a template
        // generator (and which will be cached).
        new Function("obj",
          "var p=[],print=function(){p.push.apply(p,arguments);};" +

          // Introduce the data as local variables using with(){}
          "with(obj){p.push('" +

          // Convert the template into pure JavaScript
          str
            .replace(/[\r\t\n]/g, " ")
            .split("<%").join("\t")
            .replace(/((^|%>)[^\t]*)'/g, "$1\r")
            .replace(/\t=(.*?)%>/g, "',$1,'")
            .split("\t").join("');")
            .split("%>").join("p.push('")
            .split("\r").join("\\'")
        + "');}return p.join('');");

      // Provide some basic currying to the user
      return data ? fn( data ) : fn;
    };
  })();

  $('#left_button').click(function(ev) {
    cyclePhoto(-1)
  });

  $('#right_button').click(function(ev) {
    cyclePhoto(1);
  });

  window.URL = window.URL ? window.URL :
               window.webkitURL ? window.webkitURL : window;

  function isArraysEqual() {
    if (!(images[1] && images[2])) {
      alert('Please have stuff in both folders');
      return false;
    }

    if (images[1].length !== images[2].length) {
      alert('Both folders must have equal number of photos');
      return false;
    }

      return true;
  };

  function cyclePhoto(nextPrev) {
    var arr1 = images[1];
    var arr2 = images[2];
    var thumbnails1 = document.querySelector('#thumbnails1');
    var thumbnails2 = document.querySelector('#thumbnails2');
    var isNotImage = false;

    if ( !isArraysEqual() ) { return; }

    if (index >= arr1.length - 1) {
      index = 0;
    }

    if (index === - 1) {
      index = arr1.length -1;
    }

    var file1 = arr1[index];
    var file2 = arr2[index];

      console.log(file1)
      console.log(file2)


    if (!file1.type.match(/image.*/)) {
      thumbnails1.innerHTML = '<h3>Please select an image!</h3>';
    } else {
      var data1 = {
        'file': {
          'name': file1.name,
          'src': window.URL.createObjectURL(file1),
          'fileSize': file1.fileSize,
          'type': 'before'
        }
      };
      thumbnails1.innerHTML = tmpl('thumbnail_template' + 1, data1);
    }

    if (!file2.type.match(/image.*/)) {
      thumbnails2.innerHTML = '<h3>Please select an image!</h3>';
    } else {
      var data2 = {
        'file': {
          'name': file2.name,
          'src': window.URL.createObjectURL(file2),
          'fileSize': file2.fileSize,
          'type': 'before'
        }
      };
      thumbnails2.innerHTML = tmpl('thumbnail_template' + 2, data2);
    }

    index = index + nextPrev;
  };

  function Tree(selector) {
    this.$el = $(selector);
    this.fileList = [];
    var html_ = '';
    var tree_ = {};
    var pathList_ = [];
    var self = this;

    this.render = function(object) {
      if (object) {
        for (var folder in object) {
          if (!object[folder]) { // file's will have a null value
            html_ += '<li><a href="#" data-type="file">' + folder + '</a></li>';
          } else {
            html_ += '<li><a href="#">' + folder + '</a>';
            html_ += '<ul>';
            self.render(object[folder]);
            html_ += '</ul>';
          }
        }
      }
    };

    this.buildFromPathList = function(paths) {
      for (var i = 0, path; path = paths[i]; ++i) {
        var pathParts = path.split('/');
        var subObj = tree_;
        for (var j = 0, folderName; folderName = pathParts[j]; ++j) {
          if (!subObj[folderName]) {
            subObj[folderName] = j < pathParts.length - 1 ? {} : null;
          }
          subObj = subObj[folderName];
        }
      }
      return tree_;
    }

    this.init = function(num, e) {
      // Reset
      html_ = '';
      tree_ = {};
      pathList_ = [];
      // TODO images num
      images[num] = [];
      self.fileList = e.target.files;

      // TODO: optimize this so we're not going through the file list twice
      // (here and in buildFromPathList).
      for (var i = 0, file; file = self.fileList[i]; ++i) {
        pathList_.push(file.webkitRelativePath);
        images[num].push(file);
      }

      self.render(self.buildFromPathList(pathList_));

      self.$el.html(html_).tree({
        expanded: 'li:first'
      });

      // Add full file path to each DOM element.
      var fileNodes = self.$el.get(0).querySelectorAll("[data-type='file']");
      for (var i = 0, fileNode; fileNode = fileNodes[i]; ++i) {
        fileNode.dataset['index'] = i;
      }

      // make list drag/sortable

      $("#" + self.$el.attr('id') + " ul").sortable({
         axis: 'y',
         containment: "parent",
         start: function(e, ui) {
          // creates a temporary attribute on the element with the old index
          $(this).attr('data-previndex', ui.item.index());
      },
      update: function(e, ui) {
          // gets the new and old index then removes the temporary attribute
          var newIndex = ui.item.index();
          var oldIndex = $(this).attr('data-previndex');
          $(this).removeAttr('data-previndex');
          images[num].move(+oldIndex, newIndex);
          console.log(images[num])
      }
      }).disableSelection();

      $('#file_input' + num).css('height', '20px')
      $('#file_input' + num).css('opacity', '1')
    }
  };

  var treeLeft = new Tree('#dir-tree1');
  treeLeft.$el.click(clickListItem.bind(treeLeft, 1, 'Before'));

  var treeRight = new Tree('#dir-tree2');
  treeRight.$el.click(clickListItem.bind(treeRight, 2, 'After'));

  $('#file_input1').change(treeLeft.init.bind(undefined, 1));
  $('#file_input2').change(treeRight.init.bind(undefined, 2));

  // Initial resize to force scrollbar in when file loads
  // $('#container1 div:first-of-type').css('height', (document.height - 20) + 'px');
  // window.addEventListener('resize', function(e) {
  //   $('#container1 div:first-of-type').css('height', (e.target.innerHeight - 20) + 'px');
  // });

  // $('#container2 div:first-of-type').css('height', (document.height - 20) + 'px');
  // window.addEventListener('resize', function(e) {
  //   $('#container2 div:first-of-type').css('height', (e.target.innerHeight - 20) + 'px');
  // });

  function revokeFileURL(num, e) {
    var thumb = document.querySelector('.thumbnail' + num);
    if (thumb) {
      thumb.style.opacity = 1;
    }
    window.URL.revokeObjectURL(this.src);
  };

  function clickListItem(num, state, e) {
    // this = tree instance
    if (e.target.nodeName == 'A' && e.target.dataset['type'] == 'file') {
      var file = this.fileList[e.target.dataset['index']];
      var thumbnails = document.querySelector('#thumbnails' + num);

      if (!file.type.match(/image.*/)) {
        thumbnails.innerHTML = '<h3>Please select an image!</h3>';
        return;
      }

      thumbnails.innerHTML = '<h3>Loading...</h3>';

      var thumb = document.querySelector('.thumbnail');
      if (thumb) {
        thumb.style.opacity = 0;
      }
      var data = {
        'file': {
          'name': file.name,
          'src': window.URL.createObjectURL(file),
          'fileSize': file.fileSize,
          'type': state
        }
      };

      // Render thumbnail template with the file info (data object).
      //thumbnails.insertAdjacentHTML('afterBegin', tmpl('thumbnail_template', data));
      thumbnails.innerHTML = tmpl('thumbnail_template' + num, data);
    }
  }