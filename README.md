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