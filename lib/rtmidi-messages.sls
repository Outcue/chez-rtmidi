; send-program-change : channel (int) program (int)
; Send a program change message on out for the channel with the program
(define rtmidi-send-program-change
    (lambda (out channel program)
        (let (
            (msg 
                (bytevector
                    (bitwise-ior MIDI-MESSAGE-TYPE-PROGRAM-CHANGE channel)
                    program)))
            (send-message out msg MIDI-MESSAGE-SIZE-PROGRAM-CHANGE))))

; rtmidi-send-note-on : channel (int) note (int) velocity (int)
; Send a note-on message on out for the channel with the note at the velocity
(define rtmidi-send-note-on
    (lambda (out channel note velocity)
        (let (
            (msg 
                (bytevector 
                    (bitwise-ior MIDI-MESSAGE-TYPE-NOTE-ON channel)
                    note
                    velocity)))
            (send-message out msg MIDI-MESSAGE-SIZE-NOTE-ON))))            

; rtmidi-send-note-off : channel (int) note (int) velocity (int)
; Send a note-off message on out for the channel with the note at velocity
(define rtmidi-send-note-off
    (lambda (out channel note velocity)
        (let (
            (msg (bytevector 
                    (bitwise-ior MIDI-MESSAGE-TYPE-NOTE-OFF channel)
                    note
                    velocity)))
            (send-message out msg MIDI-MESSAGE-SIZE-NOTE-OFF))))            

; rtmidi-send-control-change : channel (int) control (int) value  (int)
; Send a control change message on out for the channel with the control and value
(define rtmidi-send-control-change
    (lambda (out channel control value)
        (let (
            (msg (bytevector 
                    (bitwise-ior MIDI-MESSAGE-TYPE-CONTROL-CHANGE channel)
                    control
                    value)))
            (send-message out msg MIDI-MESSAGE-SIZE-CONTROL-CHANGE))))        

; send-message : out msg size
(define send-message
    (lambda (out msg size)
        
        (if (= (rtmidi-out-send-message out msg size) MIDI-ERROR)
                (display "Error sending message")
                (newline))))

