Button = {x,y,width,height,text,c1,c2}

function Button:new(x,y,width,height,text,c1,c2)
    o = {}
    setmetatable(o, self)
    self.__index = self
    o.x = x
    o.y = y
    o.width = width
    o.height = height
    o.text = text
    o.c1 = c1
    o.c2 = c2
    return o 
end

function Button:print(c, win)
    if win == nill then
        win = term.current()
    end
    if c == nil then
        c = self.c1
    end
    win.setBackgroundColor(c)
    win.setCursorPos(self.x,self.y)
    for i=1,self.height do
        win.setCursorPos(self.x,self.y+i-1)
        for j=1,self.width do
            win.write(' ')
        end
    end
    if self.height > 2 and not (self.text == nil) then
        midOff = 0
        if self.height % 2 == 0 then
            midOff = (self.height / 2) - 1
        else
            midOff = math.floor(self.height / 2)
        end
        len = string.len(self.text)
        centerOff = 0
        if len > self.width then
            text = string.sub(self.text, 1, self.width)
        else
            text = self.text
            diff = self.width - len
            centerOff = math.floor(diff/2)
        end
        win.setCursorPos(self.x+centerOff, self.y+midOff)
        win.write(text)
    end
end

function Button:press(win)
    if win == nil then
        win = term.current()
    end
        self:print(self.c2, win)
        sleep(0.2)
        self:print(self.c1, win)
end

function Button:check(x, y)
    if self.x <= x and self.x+self.width > x then
        if self.y <= y and self.y+self.height > y then
            return true
        end
    end
    return false
end
