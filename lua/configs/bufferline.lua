require("bufferline").setup{
  options = {
      numbers = "buffer_id",  -- No muestra los números de buffer
      separator_style = "slant",  -- Utiliza un separador slanted/triangular
      always_show_bufferline = false,  -- No muestra la línea de buffers vacía
      show_tab_indicators = true,  -- Muestra los indicadores de pestaña
      diagnostics = "nvim_lsp" ,  -- Muestra los mensajes de diagnóstico del servidor LSP
      always_show_bufferline = true, -- Siempre muestra la línea de buffer incluso si solo hay un buffer
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count..")"
      end
  },
  --highlights = {
  --buffer_selected = {
  --gui = "bold"  -- El buffer seleccionado está en negrita
  --}
  --}
}
