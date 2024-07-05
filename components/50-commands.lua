power = function()
    pager({
        {
            "==========POWER SYSTEM==========",
            "[NAV]                 [LIFE SUP]",
            "  ^                         ^",
            "  X                         I",
            "[DC 1]-->[GALLEY]  [AC]<-x[DC 2]",
            "  ^                         ^",
            "[BAT1:26V]            [BAT2:??V]",
            "  I                         I",
            "[AC 1]<----[XFEED ON]---->[AC 2]",
            "  ^            ^            ^",
            "  I            I            I",
            "[ENG 1]    [ENVIRON]     [ENG 2]",
            "================================",
            "",
            "ALL ENG OFF          [LOW POWER]",
            "BAT2 FAULT             [ISOLATE]",
            "LOW POWER MODE",
            "AC LIFE SUPPORT MODE",
            "ENVIRONMENTAL POWER HARVEST"
        }
    })
end

nav = function()
    pager({
        {
            "==============NAV===============",
            "HDG: 273                SPD: 000",
            "        oooooOOOOOOoXooOOooooOOO",
            "            oooooOOOOOOOOOOOOOoo",
            "ooo  ooo       ooooOOOOOooOOOOOO",
            "oooooooooooo     ooooooOOOOooOOO",
            "oooooooooooooooo  oooOOOOOOOOXOO",
            "ooooooooooooo      oooOOOOXOOOXO",
            "ooooooooo         oooooooooooooo",
            "ooo           /\\    oooo  oooooo",
            "             /  \\               ",
            "             ----               ",
            "================================",
            "DIMENSIONAL DRIVE OVRHT   [SLOW]",
            "NO FIX               [CALIBRATE]",
            "AUTOPILOT OFF    [MANUALLY CTRL]"
        }
    })
end
