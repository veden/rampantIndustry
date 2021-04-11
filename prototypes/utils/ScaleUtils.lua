local scaleUtils = {}

function scaleUtils.scalePicture(scale, pictureTable)
    for k,v in pairs(pictureTable) do
        if (k == "layers") then
            scaleUtils.scalePicture(scale, v)
        elseif (k == "hr_version") then
            v.scale = scale
            pictureTable.scale = 2 * scale
        elseif (type(v) == "table") then
            scaleUtils.scalePicture(scale, v)
        end
    end
end

function scaleUtils.tintPicture(pictureTable, tint)
    for _,v in pairs(pictureTable) do
        if (type(v) == "table") then
            if (v.filename) then
                v.tint = tint
            end
            scaleUtils.tintPicture(v, tint)
        end
    end
end

function scaleUtils.scaleBoundingBox(scale, box)
    return {
        {box[1][1] * scale, box[1][2] * scale},
        {box[2][1] * scale, box[2][2] * scale}
    }
end

return scaleUtils
