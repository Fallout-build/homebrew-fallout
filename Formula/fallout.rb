# Fallout CLI — the `fallout` .NET global tool (build automation for C#/.NET).
#
# Packaging: Fallout ships as a framework-dependent .NET global tool on NuGet
# (package id `Fallout.GlobalTools`, command `fallout`). This formula installs it
# via `dotnet tool install` from the .nupkg, so it depends on the `dotnet` formula
# rather than shipping a self-contained binary. (The forthcoming `fallout-agent`
# daemon will instead ship as a signed self-contained binary — see #122.)
#
# PLACEHOLDERS: `Fallout.GlobalTools` is not on a public NuGet feed yet (previews
# publish to GitHub Packages only; nuget.org publish happens at the first tagged
# release). Until then `version`/`url`/`sha256` below are placeholders and this
# formula is not installable — CI validates syntax + audit only. Fill them in when
# the first public artifact ships (tracked alongside #129/#133).
class Fallout < Formula
  desc "Code-first build automation for C#/.NET (the `fallout` CLI)"
  homepage "https://github.com/Fallout-build/Fallout"
  # NuGet flat-container URL. `using: :nounzip` keeps the .nupkg intact (it is a
  # zip; without this Homebrew would unpack it and break `--add-source`).
  url "https://api.nuget.org/v3-flatcontainer/fallout.globaltools/0.0.0/fallout.globaltools.0.0.0.nupkg", using: :nounzip
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # arm64-only for now — Intel macOS is intentionally out of scope (bleeding-edge,
  # small user base). Drop this line to re-enable Intel on demand.
  depends_on arch: :arm64
  depends_on "dotnet"

  def install
    # Treat the downloaded .nupkg (sitting in buildpath) as a single-package local
    # feed and install the tool into libexec.
    system "dotnet", "tool", "install", "Fallout.GlobalTools",
           "--version", version,
           "--tool-path", libexec,
           "--add-source", buildpath

    # Wrap the tool's apphost so it finds the brewed .NET runtime on PATH.
    dotnet = Formula["dotnet"]
    (bin/"fallout").write_env_script libexec/"fallout",
      "DOTNET_ROOT" => dotnet.opt_libexec,
      "PATH"        => "#{dotnet.opt_bin}:$PATH"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fallout --version")
  end
end
