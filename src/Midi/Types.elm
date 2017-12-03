module Midi.Types
    exposing
        ( Track
        , Header
        , MidiEvent(..)
        , MidiMessage
        , MidiRecording
        )

{-| Type Definition of a MIDI recording


# Data Types

@docs Header, Track, MidiEvent, MidiMessage, MidiRecording

-}


type alias Ticks =
    Int


type alias Channel =
    Int


type alias Note =
    Int


type alias Velocity =
    Int


{-| Midi Event
-}
type MidiEvent
    = -- meta messages
      SequenceNumber Int
    | Text String
    | Copyright String
    | TrackName String
    | InstrumentName String
    | Lyrics String
    | Marker String
    | CuePoint String
    | ChannelPrefix Int
    | Tempo Int
    | SMPTEOffset Int Int Int Int Int
    | TimeSignature Int Int Int Int
    | KeySignature Int Int
    | SequencerSpecific String
    | SysEx String
    | Unspecified Int (List Int)
      -- channel messages
    | NoteOn Channel Note Velocity
    | NoteOff Channel Note Velocity
    | NoteAfterTouch Channel Note Velocity
    | ControlChange Channel Int Int
    | ProgramChange Channel Int
    | ChannelAfterTouch Channel Velocity
    | PitchBend Channel Int
    | RunningStatus Int Int


{-| Midi Message
-}
type alias MidiMessage =
    ( Ticks, MidiEvent )


{-| Midi Track
-}
type alias Track =
    List MidiMessage


{-| Midi Header
-}
type alias Header =
    { formatType : Int
    , trackCount : Int
    , ticksPerBeat : Int
    }


{-| Midi Recording
-}
type alias MidiRecording =
    ( Header, List Track )
