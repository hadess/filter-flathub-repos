### `list-all-org-repos.sh`

`list-all-org-repos.sh` lists all the repositories inside an organisation.

```sh
$ ./list-all-org-repos.sh > all-repos.txt
```

### `list-all-dconf-repos.sh`

`list-all-dconf-repos.sh` will read `all-repos.txt`, and for each one, will
check it out, see whether it has a hole punched for DConf access, and
output its name in `all-dconf-repos.txt` if so.

```sh
$ ./list-all-dconf-repos.sh
```

### `list-all-x11-repos.sh`

`list-all-x11-repos.sh` will read `all-repos.txt`, and for each one, will
check it out, see whether it has a hole punched for X11 access even though
it can use Wayland, and output its name in `all-x11-repos.txt` if so.

### `list-all-xdg-run-gvfs-repos.sh`

`list-all-xdg-run-gvfs-repos.sh` will read `all-repos.txt`, and for each one, will
check it out, see whether it uses `--filesystem=xdg-run/gvfs`, and output
its name in `all-xdg-run-gvfs-repos.txt` if so.
