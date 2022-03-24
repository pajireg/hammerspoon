-- Vim 한영전환 불편함 해결 방법
local input_english = "com.apple.keylayout.ABC"
local input_korean = "com.apple.inputmethod.Korean.2SetKorean"

function change_input_english ()
    if (hs.keycodes.currentSourceID() == input_korean) then
        hs.keycodes.currentSourceID(input_english)
    end
    -- disable default "escape"
    hs.hotkey.disableAll({}, "escape")
    -- stroke original "escape"
    hs.eventtap.keyStroke({}, "escape")
    -- hs.eventtap.keyStroke({}, "right")
    -- remapping function to "escape"
    hs.hotkey.bind({}, "escape", change_input_english)
end

hs.hotkey.bind({}, "escape", change_input_english)
