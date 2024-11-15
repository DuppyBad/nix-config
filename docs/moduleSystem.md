# Module System Logic

Also inspired by bloxx12's nichts, the module system herein attempts to have
minimal calls to import , making it such that references are clean and
extensible with little effort

Let us explore an attempt without such a modularisation system

```nix
imports = [
    ../../../somemodule
    ../hardware/othermodule
    ]; # these are controlled by default.nix files therein, which propagate the import call down their tree
```

While initially easy to manage, the addition of new modules requires changing
both the default and the import tree, if there is a new class of module to
include

In contrast (thanks to bloxx12 and notashelf github repos: TODO Link them?) I
was exposed to another method of controlling the attribute sets:
`recursiveUpdate`

## What does recursiveUpdate do?

`recursiveUpdate` is similar to the `\\` operator in that it merges attribute
sets, but it merges them at every level, and operates on the following logic.
Where recursiveUpdate is invoked as `lib.recursiveUpdate x y`:

- If some attribute n exists in x XOR y, n is left as is.
- If some attribute n exists in x AND y, and n is also a set itself,
  recursiveUpdate will merge the nested sets too.
- If some attribute n exists in x AND y, and n is NOT a set, the y value of n
  will overwrite

These properties make it useful for combining nested structures with a default
set

N.B.

```nix
filter (hasSuffix "module.nix") # allows to match some xyz.module.nix
filter (file: baseNameOf file == "module.nix") # matches only module.nix
```

I am sure the original author had a xyz.module.nix usecase, but as we do not, we
will be strict

Instead of crafting xyz module, we can do xyz.nix, and have module import it as
such:

```nix
imports = [
    ./xxx.nix
    ./yyy.nix
    ./zzz.nix
];
```

## Part 2: exposing modules to global context

The above method allows us to avoid a lot of `imports` maintainance, but it does
not entirely solve the problem. Ideally, I would like to expose important
modules to the global scope no matter where they reside, so that stylistically
the hierarchy makes sense. This runs the risk of obfuscating the logic flow, but
this document exists in order to make sure I don't forget said logic flow.
