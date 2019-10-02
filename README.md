## Homebrew Kong 0.14 Modified Version

Homebrew tap for [Kong] :beer:

> Kong is a scalable and customizable API Management Layer built on top of
> Nginx.

### Install Kong 0.14

Make sure when you `brew list` you dont have any openresty or luarocks or kong.

```shell
$ brew install https://raw.githubusercontent.com/budiprad/homebrew-kong/master/Formula/kong.rb
```

Then, put this line on your bashrc or zshrc :
```
export PATH=$PATH:$(luarocks path)
```

or run `eval "$(luarocks path)"`

### Use Kong

```shell
$ kong -v
```

Get started by reading the documentation at: https://docs.konghq.com

[Kong]: https://konghq.com
