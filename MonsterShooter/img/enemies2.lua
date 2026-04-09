--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:dc70ef6d8fb6e19756a613ef5c0edd71:b388e73c2bf6e9d6830fcfd997533f7a:2297f2f2415c2541e8e2a52316916240$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- enem1
            x=82,
            y=1,
            width=36,
            height=57,

        },
        {
            -- enem2
            x=1,
            y=60,
            width=48,
            height=56,

        },
        {
            -- enem3
            x=1,
            y=1,
            width=79,
            height=56,

        },
    },

    sheetContentWidth = 128,
    sheetContentHeight = 128
}

SheetInfo.frameIndex =
{

    ["enem1"] = 1,
    ["enem2"] = 2,
    ["enem3"] = 3,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
