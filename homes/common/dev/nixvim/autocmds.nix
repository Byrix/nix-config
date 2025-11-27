{ lib, config, ... }:
{
  autoCmd = [
    {
      command = "checktime";
      event = [ "FocusGained" "BufEnter" ];
      pattern = [ "*" ];
    }
    {
      callback = { __raw = "function() vim.hl.on_yank() end;"; };
      event = [ "TextYankPost" ];
      group = "kickstart-highlight-yank";
    }
  ];
}
