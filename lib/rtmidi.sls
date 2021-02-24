(library 
	(rtmidi)
  
  (export
    rtmidi-get-compiled-api
    rtmidi-api-name
    rtmidi-api-display-name
    rtmidi-compiled-api-by-name
    rtmidi-error rtmidi_error
    rtmidi-open-port
    rtmidi-open-virtual-port
    rtmidi-close-port
    rtmidi-get-port-count
    rtmidi-get-port-name
    rtmidi-in-create-default
    rtmidi-in-create
    rtmidi-in-free
    rtmidi-in-get-current-api
    rtmidi-in-set-callback
    rtmidi-in-cancel-callback
    rtmidi-in-ignore-types
    rtmidi-in-get-message
    rtmidi-out-create-default
    rtmidi-out-create
    rtmidi-out-free
    rtmidi-out-get-current-api
    rtmidi-out-send-message

    rtmidi-send-program-change
    rtmidi-send-note-on
    rtmidi-send-note-off
    rtmidi-send-control-change

    MIDI-MESSAGE-TYPE-NOTE-OFF
    MIDI-MESSAGE-TYPE-NOTE-ON
    MIDI-MESSAGE-TYPE-KEY-PRESSURE
    MIDI-MESSAGE-TYPE-CONTROL-CHANGE
    MIDI-MESSAGE-TYPE-PROGRAM-CHANGE
    MIDI-MESSAGE-TYPE-CHANNEL-PRESSURE
    MIDI-MESSAGE-TYPE-PITCH-WHEEL
    MIDI-MESSAGE-TYPE-SYSEX
    MIDI-MESSAGE-SIZE-SHORT-MESSAGE
    MIDI-MESSAGE-SIZE-NOTE-OFF
    MIDI-MESSAGE-SIZE-NOTE-ON
    MIDI-MESSAGE-SIZE-KEY-PRESSURE
    MIDI-MESSAGE-SIZE-CONTROL-CHANGE
    MIDI-MESSAGE-SIZE-PROGRAM-CHANGE
    MIDI-MESSAGE-SIZE-CHANNEL-PRESSURE
    MIDI-MESSAGE-SIZE-PITCH-WHEEL

    MIDI-ERROR
  )

	(import 
    (chezscheme)
		(rtmidi ftype)
  )

  (define rtmidi-get-compiled-api rtmidi_get_compiled_api)
  (define rtmidi-api-name rtmidi_api_name)
  (define rtmidi-api-display-name rtmidi_api_display_name)
  (define rtmidi-compiled-api-by-name rtmidi_compiled_api_by_name)
  (define rtmidi-error rtmidi_error)
  (define rtmidi-open-port rtmidi_open_port)
  (define rtmidi-open-virtual-port rtmidi_open_virtual_port)
  (define rtmidi-close-port rtmidi_close_port)
  (define rtmidi-get-port-count rtmidi_get_port_count)
  (define rtmidi-get-port-name rtmidi_get_port_name)
  (define rtmidi-in-create-default rtmidi_in_create_default)
  (define rtmidi-in-create rtmidi_in_create)
  (define rtmidi-in-free rtmidi_in_free)
  (define rtmidi-in-get-current-api rtmidi_in_get_current_api)
  (define rtmidi-in-set-callback rtmidi_in_set_callback)
  (define rtmidi-in-cancel-callback rtmidi_in_cancel_callback)
  (define rtmidi-in-ignore-types rtmidi_in_ignore_types)
  (define rtmidi-in-get-message rtmidi_in_get_message)
  (define rtmidi-out-create-default rtmidi_out_create_default)
  (define rtmidi-out-create rtmidi_out_create)
  (define rtmidi-out-free rtmidi_out_free)
  (define rtmidi-out-get-current-api rtmidi_out_get_current_api)
  (define rtmidi-out-send-message rtmidi_out_send_message)

  (include "rtmidi-messages.sls")
  (include "rtmidi-values.sls")

)
 
