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

The `fallout` formula is scaffolded but **not yet installable** — it has no token-free source to install from. `Fallout.GlobalTools` is public on GitHub Packages, but GitHub's NuGet registry requires authentication even for public packages (anonymous download returns `401`), so the formula can't point at it. nuget.org has nothing yet (publish lands at the first tagged release). The formula's `version`/`url`/`sha256` are placeholders until an anonymously-downloadable preview artifact exists; CI validates Ruby syntax + `brew audit` only.

Getting to an installable preview is tracked in [Fallout#482](https://github.com/Fallout-build/Fallout/issues/482); formula bumping on each stable tag in [Fallout#133](https://github.com/Fallout-build/Fallout/issues/133).

## License

[MIT](LICENSE) — same as the Fallout project.
