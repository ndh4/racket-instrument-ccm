## Test programs
To run a test program:
1. Change line 3 in `resolve-main.rkt` to point to a test file that contains a `main` method (typically titled `main.rkt`).
2. Run ```./racket/bin/racket ./test-programs/blame-printer.rkt``` and ```./racket/bin/racket ./test-programs/run.rkt``` to see the program output with and without logging, respectively.

## Current problems
- Mysterious source of double counting in `higher-order`
  - When `c` and `a` guard the entrance to function `f`, and `b` and `d` guard the exit, these are the logs that result from a call to `f`:
      ```
      #<blame-no-swap>
      #<blame-no-swap>
      c 10
      #<blame-yes-swap>
      #<blame-yes-swap>
      a 10
      f body
      #<blame-yes-swap>
      b 12
      #<blame-no-swap>
      d 12
      ```
  - Notice how `c` and `a` have two logs each, while `b` and `d` have only one. The explanation for this is currently opaque to us.
- Ignoring initial check in `smallest`
  - The `integer?-print` contract clearly gets checked when v's inital value is set.
  - Vincent's profiler picks up on it.
    ```
      > ./racket/bin/raco contract-profile test-programs/run.rkt
       integer? 2
      Running time is 38.13% contracts
      487/1276 ms
        
      integer?-print                                                   486.5 ms
      main.rkt:10:17                                                  
      v                                                            486.5 ms
    ```
  - Ours does not.
    ```
      > ./racket/bin/racket test-programs/blame-printer.rkt
       integer? 2
      Number of payloads: 0
    ```