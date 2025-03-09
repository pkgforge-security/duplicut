### ℹ️ About
This is a fork of [nil0x42/duplicut](https://github.com/nil0x42/duplicut).

### 🖳 Installation
Use [soar](https://github.com/pkgforge/soar) & Run:
```bash
❯ !#Lightweight (MUSL) at cost of performance
soar add 'duplicut#github.com.pkgforge-security.duplicut.musl'

❯ !#Larger (GLIBC) for max performance
soar add 'duplicut#github.com.pkgforge-security.duplicut.glibc'
```

### 🧰 Usage
```mathematica
❯ duplicut --help

Usage: duplicut [OPTION]... [INFILE] -o [OUTFILE]
Remove duplicate lines from INFILE without changing order.

Options:
-o, --outfile <FILE>       Write result to <FILE>
-t, --threads <NUM>        Max threads to use (default max)
-m, --memlimit <VALUE>     Limit max used memory (default max)
-l, --line-max-size <NUM>  Max line size (default 64)
-p, --printable            Filter ascii printable lines
-c, --lowercase            Convert wordlist to lowercase
-C, --uppercase            Convert wordlist to uppercase
-h, --help                 Display this help and exit
-v, --version              Output version information and exit

Example: duplicut wordlist.txt -o new-wordlist.txt
```
