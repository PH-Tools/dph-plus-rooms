# Load support files.
require 'sketchup.rb'
require 'extensions.rb'

module BT

    module DPH_Plus_Rooms
    # Info
      EXTVERSION            = "1.2.1"
      EXTREVDATE            = "June 18, 2021"
      EXTTITLE              = "dPH+ Rooms"
      EXTNAME               = "bt_dphPlus_rooms"
      EXTDESCRIPTION        = "For modeling and managing room data through dynamic components"
      
      @extdir = File.dirname(__FILE__)
      @extdir.force_encoding('UTF-8') if @extdir.respond_to?(:force_encoding)
      EXTDIR = @extdir
      
      loader = File.join( EXTDIR , EXTNAME , "bt_dphPlus_toolbar.rb" )
      puts loader
      # Create extension
      extension             = SketchupExtension.new( EXTTITLE , loader )
      extension.copyright   = "Copyright 2019-#{Time.now.year} Ed May"
      extension.creator     = "Ed May, bldgtyp, llc"
      extension.version     = EXTVERSION
      extension.description = EXTDESCRIPTION
      
      Sketchup.register_extension( extension , true )
           
    end  # module DPH_Plus_Rooms
    
  end  # module BT