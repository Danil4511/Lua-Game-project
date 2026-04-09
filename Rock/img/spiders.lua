--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:fca8bffcc314c0b0f2c6c808ad8f31ca:4b144345b605f7ed2c9c7561e752ad75:1f14e48e6d2fc5b7bb690dbf6046739b$
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
            -- spider1
            x=1,
            y=1,
            width=122,
            height=130,

        },
        {
            -- spider2
            x=125,
            y=1,
            width=122,
            height=130,

        },
        {
            -- spider3
            x=1,
            y=133,
            width=122,
            height=130,

        },
        {
            -- spider4
            x=125,
            y=133,
            width=122,
            height=130,

        },
    },

    sheetContentWidth = 256,
    sheetContentHeight = 512
}

SheetInfo.frameIndex =
{

    ["spider1"] = 1,
    ["spider2"] = 2,
    ["spider3"] = 3,
    ["spider4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
