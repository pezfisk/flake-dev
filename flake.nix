{
  description = "Collection of personal nix templates";

  outputs = { self, ... }: {
    templates = {
      trivial = {
        path = ./templates/trivial;
	description = "does nothing";
      };

      rust = {
        path = ./templates/rust;
	description = "Basic rust-naersk template";
      };

      rust-slint = {
        path = ./templates/rust-slint;
	description = "Basic rust-slint-naersk template";
      };

      python = {
        path = ./templates/python;
	description = "Basic python template";
      };

      defaultTemplate = self.templates.
    };
  };
}
