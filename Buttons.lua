require('Button')
local buttons = {}
local size = 0

local function create(name,x,y,width,height,text,c1,c2,win)
    button = Button:new(x,y,width,height,text,c1,c2)
    buttons[size] = {name = name, button = button, win = win}
    size = size + 1
end

local function printAll()
    term.clear()
    for k,v in pairs(buttons) do
        v.button:print(nil, v.win)
    end
end

local function test() 
    return true
end

local function checkAny(x, y)
    for k,v in pairs(buttons) do
        if v.button:check(x,y) then
            v.button:press(v.win)
            os.queueEvent('button_press', v.name)
            return true
        end
    end    
    return false
end
return {create = create, printAll = printAll, checkAny = checkAny}
