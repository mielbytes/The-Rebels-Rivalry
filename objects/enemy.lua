function enemy(x, y, type)
    if type == "rookie" then
        return rookie(x,y)
    end
    if type == "officer" then
        return officer(x,y)

    end
    if type == "sniper" then
        return sniper(x,y)
    end
    if type == "general" then
        return general(x,y)
    end
end



