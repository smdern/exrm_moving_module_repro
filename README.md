# ExrmMovingModuleRepro

Repro for https://github.com/bitwalker/exrm/issues/243

To reproduce:

```bash
git checkout 0.0.1
mix deps.get
mix release
git checkout 0.0.2
mix deps.get
mix release --verbosity=verbose
```

Expected:

To build release upgrade that uses the module defined in the new location

Actual:

```shell
Provider (relup) failed with: {error,
 {rlx_prv_relup,
  {relup_script_generation_error,
   systools_make,
   {duplicate_modules,
    [{{'Elixir.Poison.Decoder.Monetized.Money',
       monetized,
       "/Users/shaun/Desktop/workspace/exrm_moving_module_repro/rel/exrm_moving_module_repro/lib/monetized-0.4.0/ebin"},
      {'Elixir.Poison.Decoder.Monetized.Money',
       exrm_moving_module_repro,
       "/Users/shaun/Desktop/workspace/exrm_moving_module_repro/rel/exrm_moving_module_repro/lib/exrm_moving_module_repro-0.0.1/ebin"}}]}}}}
```

Background:
Protocol implementation was defined in our app v0.0.1. v0.0.2 has protocol
defined in the updated monetized lib so we removed the implementation in our
app. Release doesn't consider a module might have moved to a different lib.
