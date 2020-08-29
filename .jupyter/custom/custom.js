// Configure CodeMirror Keymap
require([
    'nbextensions/vim_binding/vim_binding',   // depends your installation
], function() {
    // Map jj to <Esc>
    CodeMirror.Vim.map("jk", "<Esc>", "insert");
});
