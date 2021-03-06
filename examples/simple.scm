(import (rtmidi))

(define midiout (rtmidi-out-create-default))

(define channel 0)

(cond 
    ((zero? midiout)
        (display "Unable to create default MIDI out."))
    (else
        (let ([portcount (rtmidi-get-port-count midiout)])

            (cond 
                ((zero? portcount)
                    (display "No output ports.\n"))
                (else 
                    (rtmidi-open-port midiout 0 (rtmidi-get-port-name midiout 0))
                    (rtmidi-send-program-change midiout channel 79)
                    (rtmidi-send-control-change midiout channel 7 10)
                    (rtmidi-send-note-on midiout channel 64 90)
                    (sleep (make-time 'time-duration (* 250 1000000) 0))))
                    (rtmidi-send-note-off midiout channel 64 0)
                    (rtmidi-close-port midiout))
            
        (rtmidi-out-free midiout)
    )
)

