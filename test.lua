Buttons = require("Buttons")
local win = peripheral.wrap("left")
Buttons.create("test1",2,2,7,3,'test1',colors.green,colors.red, win)
Buttons.create("test2",11,2,7,3,'test2',colors.green,colors.red, win)
Buttons.printAll()
while true do
    _,_,x,y = os.pullEvent('monitor_touch')
    if Buttons.checkAny(x, y) then
        _,name = os.pullEvent('button_press')
        print("hit " .. name)
    end
end
