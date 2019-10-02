## Homebrew Kong 0.14.1 Modified Version

Homebrew tap for [Kong] :beer: 🐵

> Kong is a scalable and customizable API Management Layer built on top of
> Nginx.

### Install Kong 0.14.1

Make sure when you `brew list` you dont have any openresty or luarocks or kong.

```shell
$ brew install https://raw.githubusercontent.com/budiprad/homebrew-kong/master/Formula/kong.rb
```

Dont forget to make it available globally using :
```
luarocks path >> ~/.bashrc
```
you can change `.bashrc` to `.zshrc` or any other of your preferences


### Verify Kong

```shell
$ kong version
0.14.1
```

Get started by reading the documentation at: https://docs.konghq.com

[Kong]: https://konghq.com
