module Net; module Denon

  # Definitions of constants.
  module Constants
    
    CR                   = "\r"

    POWER                = 'PW'
    POWER_ON             = 'PWON'
    POWER_STANDBY        = 'PWSTANDBY'
    POWER_STATUS         = 'PW?'

    MASTER_VOLUME        = 'MV'
    MASTER_VOLUME_UP     = 'MVUP'
    MASTER_VOLUME_DOWN   = 'MVDOWN'
    MASTER_VOLUME_SET    = 'MV'
    MASTER_VOLUME_STATUS = 'MV?'
    MASTER_VOLUME_MAX    = 'MVMAX'
    
    CHANNEL_VOLUME       = 'CV'

    MUTE                 = 'MU'
    MUTE_ON              = 'MUON'
    MUTE_OFF             = 'MUOFF'
    MUTE_STATUS          = 'MU?'

    INPUT_SOURCE         = 'SI'
    INPUT_SOURCE_PHONO   = 'SIPHONO'
    INPUT_SOURCE_CD      = 'SICD'
    INPUT_SOURCE_TUNER   = 'SITUNER'
    INPUT_SOURCE_DVD     = 'SIDVD'
    INPUT_SOURCE_HDP     = 'SIHDP'
    INPUT_SOURCE_TV_CBL  = 'SITV/CBL'
    INPUT_SOURCE_SAT     = 'SISAT'
    INPUT_SOURCE_VCR     = 'SIVCR'
    INPUT_SOURCE_DVR     = 'SIDVR'
    INPUT_SOURCE_V_AUX   = 'SIV.AUX'
    INPUT_SOURCE_NET_USB = 'SINET/USB'
    INPUT_SOURCE_XM      = 'SIXM'
    INPUT_SOURCE_HDRADIO = 'SIHDRADIO'
    INPUT_SOURCE_DAB     = 'SIDAB'
    INPUT_SOURCE_IPOD    = 'SIIPOD'
    INPUT_SOURCE_SERVER  = 'SISERVER'
    INPUT_SOURCE_NAPSTER = 'SINAPSTER'
    INPUT_SOURCE_LASTFM  = 'SILASTFM'
    INPUT_SOURCE_MPLAYER = 'SIMPLAY'
    INPUT_SOURCE_STATUS  = 'SI?'

    MAIN_ZONE            = 'ZM'

    RECORD_SOURCE        = 'SR'

    SURROUND_MODE               = 'MS'
    SURROUND_MODE_MOVIE         = 'MSMOVIE'
    SURROUND_MODE_MUSIC         = 'MSMUSIC'
    SURROUND_MODE_GAME          = 'MSGAME'
    SURROUND_MODE_DIRECT        = 'MSDIRECT'
    SURROUND_MODE_PURE_DIRECT   = 'MSPURE DIRECT'
    SURROUND_MODE_STEREO        = 'MSSTEREO'
    SURROUND_MODE_STANDARD      = 'MSSTANDARD'
    SURROUND_MODE_DOLBY_DIGITAL = 'MSDOLBY DIGITAL'
    SURROUND_MODE_DTS_SURROUND  = 'MSDTS SURROUND'
    SURROUND_MODE_MCH_STEREO    = 'MSMCH STEREO'
    SURROUND_MODE_ROCK_ARENA    = 'MSROCK ARENA'
    SURROUND_MODE_JAZZ_CLUB     = 'MSJAZZ CLUB'
    SURROUND_MODE_MONO_MOVIE    = 'MSMONO MOVIE'
    SURROUND_MODE_MATRIX        = 'MSMATRIX'
    SURROUND_MODE_VIDEO_GAME    = 'MSVIDEO GAME'
    SURROUND_MODE_VIRTUAL       = 'MSVIRTUAL'
    SURROUND_MODE_STATUS        = 'MS?'

    MULTEQ          = 'PSMULTEQ'
    MULTEQ_AUDYSSEY = 'PSMULTEQ:AUDYSSEY'
    MULTEQ_BYP_LR   = 'PSMULTEQ:BYP.LR'
    MULTEQ_FLAT     = 'PSMULTEQ:FLAT'
    MULTEQ_MANUAL   = 'PSMULTEQ:MANUAL'
    MULTEQ_OFF      = 'PSMULTEQ:OFF'
    MULTEQ_STATUS   = 'PSMULTEQ: ?'

    DYNEQ        = 'PSDYNEQ'
    DYNEQ_ON     = 'PSDYNEQ ON'
    DYNEQ_OFF    = 'PSDYNEQ OFF'
    DYNEQ_STATUS = 'PSDYNEQ ?'

    DYNVOL        = 'PSDYNVOL'
    DYNVOL_HEAVY  = 'PSDYNVOL HEV'
    DYNVOL_MEDIUM = 'PSDYNVOL MED'
    DYNVOL_LIGHT  = 'PSDYNVOL LIT'
    DYNVOL_OFF    = 'PSDYNVOL OFF'
    DYNVOL_STATUS = 'PSDYNVOL ?'

  end
  
end; end
