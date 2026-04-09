--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:fb86d404c55b50d1dcac63e9573593bd:d8301ef42bd83ba7cd6e3055bc4afb60:55128db5b93dc9e1e12150a26f147560$
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
            -- bat1
            x=1,
            y=1,
            width=73,
            height=86,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 86
        },
        {
            -- bat2
            x=1,
            y=89,
            width=69,
            height=86,

        },
        {
            -- bat3
            x=1,
            y=1,
            width=73,
            height=86,

            sourceX = 0,
            sourceY = 0,
            sourceWidth = 75,
            sourceHeight = 86
        },
        {
            -- bat4
            x=1,
            y=89,
            width=69,
            height=86,

        },
    },

    sheetContentWidth = 128,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["bat1"] = 1,
    ["bat2"] = 2,
    ["bat3"] = 3,
    ["bat4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
