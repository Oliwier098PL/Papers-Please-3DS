local Menu = {}

-- Load title screen assets and initialize variables
function Menu.load()
    MenuSpritesheet = love.graphics.newImage("assets/textures/MenuSpritesheet.png")

    Logo            = love.graphics.newQuad(0,0,      315,181,  MenuSpritesheet)
    StoryButton     = love.graphics.newQuad(0,222,    258,34,   MenuSpritesheet)
    SettingsButton  = love.graphics.newQuad(454,198,  58,58,    MenuSpritesheet)

    MainTheme = love.audio.newSource("assets/sounds/MainTheme.ogg", "stream")
    MainTheme:setLooping(true)
    love.audio.play(MainTheme)

    -- Logo animation and sound variables
    LogoY            = 20
    LogoTimer        = 1.105
    LogoUp           = true

    LogoUpYMax       = 20
    LogoDownYMax     = 26
    LogoTimerSet     = 1.105
    LogoSpeed        = 64
end

function Menu.update(dt)
    -- Animate logo bouncing
    if LogoUp == true then
        if LogoY <= LogoUpYMax then
            LogoTimer = LogoTimer - dt

            if LogoTimer <= 0 then
                LogoTimer = LogoTimerSet
                LogoUp = false
            end
        else
            LogoY = LogoY - LogoSpeed * dt
        end
    else
        if LogoY >= LogoDownYMax then
            LogoTimer = LogoTimer - dt

            if LogoTimer <= 0 then
                LogoTimer = LogoTimerSet
                LogoUp = true
            end
        else
            LogoY = LogoY + LogoSpeed * dt
        end
    end
end

function Menu.draw(screen)
    if screen == "bottom" then
		-- Draw bottom screen content
        love.graphics.draw(MenuSpritesheet,StoryButton,     31,62)
        love.graphics.draw(MenuSpritesheet,SettingsButton, 1,181)
    else
        -- Draw top screen content
        love.graphics.draw(MenuSpritesheet,Logo,            42,LogoY)
    end
end

return Menu