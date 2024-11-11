The `racket-instrument-ccm` branch of this repository 
contains a version of Racket forked from v8.14, such that
two parameters have been added: `log-ccm-entry?` and `log-ccm-entry!`.
By default, `log-ccm-entry?` is false.
When `log-ccm-entry?` is set to true, `log-ccm-entry!` is called at the
same points in the code where a contract continuation mark would be inserted.

To Build
-----------
Run `make`. If the `./racket/share` directory
exists, you may have to delete it before rebuilding.

For more information on building Racket from source, see the
[Build Guide](build.md).

To Run
-----------
Call `./racket/bin/racket` from the command line. For example:
```
./racket/bin/racket ./test-programs/blame-printer.rkt