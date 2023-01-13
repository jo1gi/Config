{ godot_4, mono }:

godot_4.overrideAttrs(oldAttrs: rec {
  pname = "godot-mono";
  version = "4.0";
  sconsFlags = "platform=linuxbsd target=editor production=true module_mono_enabled=yes";
  buildInputs = oldAttrs.buildInputs ++ [mono];
})
