// custom operator for commenting
// (similar to commentary by Tim Pope)
// this woks with visual selection ('vipgc') and with motions ('gcip')
require(['nbextensions/vim_binding/vim_binding', 'base/js/namespace'], function(vim_binding, ns) {
  CodeMirror.Vim.defineOperator("comment_op", function(cm) {
    cm.toggleComment();
  });
  CodeMirror.Vim.mapCommand("gc", "operator", "comment_op", {});
  CodeMirror.Vim.map('jk', '<Esc>', 'insert');
  CodeMirror.Vim.map('<C-c>', '<Esc>', 'insert');
  CodeMirror.Vim.map('<C-s>', '<Esc>/', 'insert');
  CodeMirror.Vim.map('<C-r>', '<Esc>?', 'insert');

  vim_binding.on_ready_callbacks.push(function(){
    let km = ns.keyboard_manager;
    // Indicate the key combination to run the commands
    console.log('[custom.js] binding ctrl-[')
    km.edit_shortcuts.add_shortcut('ctrl-[', CodeMirror.prototype.leaveInsertMode, true);
    km.edit_shortcuts.add_shortcut('shift-ctrl-[', CodeMirror.prototype.leaveNormalMode, true);
    console.log('[custom.js] done')
    // Update help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });

  CodeMirror.Vim.defineOperator("surround_op", function(cm) {
    console.log(cm)
  });
  CodeMirror.Vim.mapCommand("ys", "operator", "surround_op", {});

});
