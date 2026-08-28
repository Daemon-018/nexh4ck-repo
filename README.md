# NexH4ck APT Repository

**NexH4ck** is a Termux security lab terminal — a curated, ROE-first catalog of
authorized security tools (recon, scan, web, password, wireless) that
lite-installs them from the official Termux packages, pip and git on demand.

This repository hosts the signed **APT** package for Termux so it installs via
`pkg install`, termuxvoid-style.

> **ROE-FIRST:** Use only against systems you own or are explicitly authorized
> to test. NexH4ck never overrides your shell commands and ships no
> phishing / ransomware payloads. Don't trust, verify.

## Add the repository

```bash
curl -fsSL https://raw.githubusercontent.com/Daemon-018/nexh4ck-repo/main/install.sh | bash
```

## Install NexH4ck

```bash
pkg update
pkg install nexh4ck
nexh4ck help
```

## Manual add (if you prefer)

```bash
mkdir -p "$PREFIX/etc/apt/sources.list.d"
echo 'deb [arch=all] https://daemon-018.github.io/nexh4ck-repo nexh4ck main' > "$PREFIX/etc/apt/sources.list.d/nexh4ck.list"
curl -fsSL https://daemon-018.github.io/nexh4ck-repo/nexh4ck-repo.gpg -o "$PREFIX/etc/apt/trusted.gpg.d/nexh4ck-repo.gpg"
apt update
pkg install nexh4ck
```

## Layout

```
├── debs/                      # .deb packages
├── dists/nexh4ck/             # Release / InRelease / Release.gpg (signed)
│   └── main/binary-all/       # Packages index
└── nexh4ck-repo.gpg           # public signing key
```

## Verify & trust

Don't install blindly — inspect the package scripts first:

```bash
apt download nexh4ck
dpkg-deb -e nexh4ck_*.deb   # extracts DEBIAN/ (control, postinst, postrm)
```

## Author

Crafted by [**@Daemon-018**](https://github.com/Daemon-018). Project tool repo:
[Daemon-018/NexH4ck](https://github.com/Daemon-018/NexH4ck).

## License

MIT — free, open source, shareable.
