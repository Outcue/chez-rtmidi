# Chez-RtMidi
An interface to RtMidi for Chez Scheme.

```scheme
(import (rtmidi))

(sdl-init SDL-INIT-VIDEO)

(define win
  (sdl-create-window "chezscheme"
                     SDL-WINDOWPOS-UNDEFINED
                     SDL-WINDOWPOS-UNDEFINED
                     640
		     480))

(define (event-loop)
  (sdl-poll-event)
  (cond
    ((sdl-event-none?) (event-loop))
    ((sdl-event-quit?) '())
    (else
      (event-loop))))

(event-loop)

(sdl-destroy-window win)
(sdl-quit)
```


# Features

* Scheme style interface to RtMidi
* Minimal overhead wrapping
* Full marshalling of Scheme data to C data
* Lower level ftype interface provided
* Developer friendly documentation


# Quickstart Guide

0. Install [Chez Scheme](https://github.com/cisco/ChezScheme) and [RtMidi](https://github.com/thestk/rtmidi/).

1. Install Chez-RtMidi where the Chez Scheme system can find it.
```bash
export CHEZSCHEMELIBDIRS="/path/to/chez-rtmidi/lib:$CHEZSCHEMELIBDIRS"
```

2. Start running the demos.
```bash
scheme --script ./simple.ss
```

3. Read the [documentation](https://outcue.github.io/chez-rtmidi/).
