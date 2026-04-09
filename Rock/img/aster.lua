--
-- created with TexturePacker - https://www.codeandweb.com/texturepacker
--
-- $TexturePacker:SmartUpdate:b9c1e1c41f0f3e966fe5a538513c9d87:dc5abb41ca53dd5df9234b530b7bec22:484b2c193725e03273f36ee4c643e503$
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
            -- ast
            x=1,
            y=1,
            width=1366,
            height=214,

        },
    },

    sheetContentWidth = 1368,
    sheetContentHeight = 216
}

SheetInfo.frameIndex =
{

    ["ast"] = 1,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
