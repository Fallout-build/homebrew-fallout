# homebrew-fallout

Homebrew tap for [**Fallout**](https://github.com/Fallout-build/Fallout) — code-first build automation for C#/.NET.

## Install

```sh
brew tap Fallout-build/fallout
brew install fallout
```

`brew tap Fallout-build/fallout` clones this repo (`Fallout-build/homebrew-fallout`); the `homebrew-` prefix is dropped in the tap name.

## Formulae

| Formula | What it is | Status |
| --- | --- | --- |
| `fallout` | The `fallout` CLI — the build-automation tool (a .NET global tool; needs the `dotnet` runtime). | Scaffolded — not yet installable (see below). |
| `fallout-agent` | The CD deployment-agent daemon (RFC #113), installed as a `brew services` launchd daemon. | Planned — [#122](https://github.com/Fallout-build/Fallout/issues/122). |

## Platform support

**Apple silicon (arm64) only.** Intel (`x86_64`) macOS is intentionally out of scope for now; it can be added on demand. See [#122](https://github.com/Fallout-build/Fallout/issues/122) for the agent's OS matrix.

## Status

The `fallout` formula is scaffolded but **not yet installable**: `Fallout.GlobalTools` is not on a public NuGet feed yet (previews publish to GitHub Packages only; nuget.org publish lands at the first tagged release). The formula's `version`/`url`/`sha256` are placeholders until then, and CI validates Ruby syntax + `brew audit` only. Formula bumping on each stable tag is tracked in [#133](https://github.com/Fallout-build/Fallout/issues/133).

## License

[MIT](LICENSE) — same as the Fallout project.
