(library 
	(rtmidi ftype)
	(export 
		RtMidiWrapper
		RtMidiCCallback

		RtMidiPtr
		RtMidiInPtr
		RtMidiOutPtr

		RtMidiAPI_UNSPECIFIED
		RtMidiAPI_MACOSX_CORE
		RtMidiAPI_LINUX_ALSA
		RtMidiAPI_UNIX_JACK
		RtMidiAPI_WINDOWS_MM
		RtMidiAPI_RtMidiDUMMY
		RtMidiAPI_NUM

		RtMidiERROR_WARNING    			
		RtMidiERROR_DEBUG_WARNING 		
		RtMidiERROR_UNSPECIFIED    		
		RtMidiERROR_NO_DEVICES_FOUND    
		RtMidiERROR_INVALID_DEVICE    	
		RtMidiERROR_MEMORY_ERROR    	
		RtMidiERROR_INVALID_PARAMETER   
		RtMidiERROR_INVALID_USE   		
		RtMidiERROR_DRIVER_ERROR   		
		RtMidiERROR_SYSTEM_ERROR   		
		RtMidiERROR_THREAD_ERROR

		rtmidi_get_compiled_api
		rtmidi_api_name
		rtmidi_api_display_name
		rtmidi_compiled_api_by_name
		rtmidi_error
		rtmidi_open_port
		rtmidi_open_virtual_port
		rtmidi_close_port
		rtmidi_get_port_count
		rtmidi_get_port_name
		rtmidi_in_create_default
		rtmidi_in_create
		rtmidi_in_free
		rtmidi_in_get_current_api
		rtmidi_in_set_callback
		rtmidi_in_cancel_callback
		rtmidi_in_ignore_types
		rtmidi_in_get_message
		rtmidi_out_create_default
		rtmidi_out_create
		rtmidi_out_free
		rtmidi_out_get_current_api
		rtmidi_out_send_message)

	(import 
		(chezscheme))

	(define *rtmidi*
		(case (machine-type)
			((i3nt  ti3nt  a6nt  ta6nt)  (load-shared-object "rtmidi.dll"))
			((i3le  ti3le  a6le  ta6le)  (load-shared-object "librtmidi.so"))
			((i3osx ti3osx a6osx ta6osx) (load-shared-object "librtmidi.dylib"))))

	(define-syntax rtmidi-procedure
		(syntax-rules ()
	  		((rtmidi-procedure name params return)
	   		(if (foreign-entry? name)
	   			(foreign-procedure name params return)
	   		(lambda args
				(error 'RTMIDI "Function not exported in librtmidi." name))))))

	(define-ftype RtMidiPtr 		void*)
	(define-ftype RtMidiInPtr   	void*)
	(define-ftype RtMidiOutPtr   	void*)

	(define RtMidiAPI_UNSPECIFIED    	0)
	(define RtMidiAPI_MACOSX_CORE 		1)
	(define RtMidiAPI_LINUX_ALSA    	2)
	(define RtMidiAPI_UNIX_JACK    		3)
	(define RtMidiAPI_WINDOWS_MM    	4)
	(define RtMidiAPI_RtMidiDUMMY    	5)
	(define RtMidiAPI_NUM   	 		6)

	(define RtMidiERROR_WARNING    			0)
	(define RtMidiERROR_DEBUG_WARNING 		1)
	(define RtMidiERROR_UNSPECIFIED    		2)
	(define RtMidiERROR_NO_DEVICES_FOUND    3)
	(define RtMidiERROR_INVALID_DEVICE    	4)
	(define RtMidiERROR_MEMORY_ERROR    	5)
	(define RtMidiERROR_INVALID_PARAMETER   6)
	(define RtMidiERROR_INVALID_USE   		7)
	(define RtMidiERROR_DRIVER_ERROR   		8)
	(define RtMidiERROR_SYSTEM_ERROR   		9)
	(define RtMidiERROR_THREAD_ERROR   		10)

	(define-ftype RtMidiWrapper
		(struct 
    		(ptr 	void*) 
	    	(data	void*)
	    	(ok		boolean)
	    	(msg	(array 32 char))))

	(define-ftype RtMidiCCallback
    	(function (double string size_t void*) void))

  	(define rtmidi_get_compiled_api (rtmidi-procedure "rtmidi_get_compiled_api" (u32* unsigned-32) int))
  	(define rtmidi_api_name (rtmidi-procedure "rtmidi_api_name" (int) string))
  	(define rtmidi_api_display_name (rtmidi-procedure "rtmidi_api_display_name" (int) string))
  	(define rtmidi_compiled_api_by_name (rtmidi-procedure "rtmidi_compiled_api_by_name" (string) int))
  	(define rtmidi_error (rtmidi-procedure "rtmidi_error" (int) string))
  	(define rtmidi_open_port (rtmidi-procedure "rtmidi_open_port" (RtMidiPtr unsigned-32 string) void))
  	(define rtmidi_open_virtual_port (rtmidi-procedure "rtmidi_open_virtual_port" (RtMidiPtr string) void))
  	(define rtmidi_close_port (rtmidi-procedure "rtmidi_close_port" (RtMidiPtr) void))
  	(define rtmidi_get_port_count (rtmidi-procedure "rtmidi_get_port_count" (RtMidiPtr) unsigned-32))
  	(define rtmidi_get_port_name (rtmidi-procedure "rtmidi_get_port_name" (RtMidiPtr unsigned-32) string))
  	(define rtmidi_in_create_default (rtmidi-procedure "rtmidi_in_create_default" () RtMidiInPtr))
  	(define rtmidi_in_create (rtmidi-procedure "rtmidi_in_create" (int string unsigned-32) RtMidiInPtr))
  	(define rtmidi_in_free (rtmidi-procedure "rtmidi_in_free" (RtMidiInPtr string) void))
  	(define rtmidi_in_get_current_api (rtmidi-procedure "rtmidi_in_get_current_api" (RtMidiPtr) int))
  	(define rtmidi_in_set_callback (rtmidi-procedure "rtmidi_in_set_callback" (RtMidiPtr (* RtMidiCCallback) void*) void))
  	(define rtmidi_in_cancel_callback (rtmidi-procedure "rtmidi_in_cancel_callback" (RtMidiInPtr) void))
  	(define rtmidi_in_ignore_types (rtmidi-procedure "rtmidi_in_ignore_types" (RtMidiInPtr boolean boolean boolean) void))
  	(define rtmidi_in_get_message (rtmidi-procedure "rtmidi_in_get_message" (RtMidiInPtr string size_t) double))
  	(define rtmidi_out_create_default (rtmidi-procedure "rtmidi_out_create_default" () RtMidiOutPtr))
	(define rtmidi_out_create (rtmidi-procedure "rtmidi_out_create" (int string) RtMidiOutPtr))
	(define rtmidi_out_free (rtmidi-procedure "rtmidi_out_free" (RtMidiOutPtr) void))
	(define rtmidi_out_get_current_api (rtmidi-procedure "rtmidi_out_get_current_api" (RtMidiPtr) int))
	(define rtmidi_out_send_message (rtmidi-procedure "rtmidi_out_send_message" (RtMidiOutPtr u8* int) int))
)

