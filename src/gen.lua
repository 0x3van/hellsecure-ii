loadstring = load
local Generate = {Dead = false, Types = {"Function",
    "Boolean", "Loop"}, Functions = {}, LuaFunctions = {"error", "rawget", "rawset", "require", "rawequal", "type", "tonumber", "tostring", "table.remove", "table.insert", "table.sort", "table.concat", "ipairs", "pcall", "print", "assert", "setfenv", "setmetatable", "string.rep", "string.reverse", "string.upper", "string.sub", "string.dump", "string.find", "string.format", "string.gsub", "string.gmatch", "string.len", "string.lower", "string.char", "string.byte", "string.match", "debug.traceback", "getfenv", "getmetatable", "load", "loadstring", "pcall", "coroutine.wrap", "coroutine.resume", "coroutine.running", "coroutine.yield", "coroutine.status", "coroutine.create", "math.exp", "math.rad", "math.random", "math.randomseed", "math.tan", "math.tanh", "math.pow", "math.abs", "math.acos", "math.asin", "math.atan", "math.atan2", "math.sin", "math.sinh", "math.sqrt", "math.deg", "math.fmod", "math.floor", "math.frexp", "math.log", "math.ldexp", "math.cos", "math.ceil", "math.cosh", "math.max", "math.min", "math.modf"}, Memes = {"Pepsi", "Was", "Fucking", "Here", "Godlyness resides in the great pepsi", "pepsi was here", "dope", "pepsi is gooder than coke", "gooder means more than better", "bruh", "grammer iz overrated", "oops", "loser", "did u no tht every obf is crackable?", "lets try loadstring = print", "blinding light of destiny",
        "gamestop is closing their underperforming stores", "rehab center lunch  times. holy fuck, its like a damn zoo. these losers swarm the food line like their life depends on it. litteraily like animals. never tour a rehab center during lunch lol", "omg!!!!!!1!!!!1!!!!!!111!!1!1!!1!1!1. you totally thought i was going to say something!!",
        "the only word in english calss i cpuld always spell right was AssAssIn. maybe bc its two asses and one in?", "hi", "hello world!", "hello", "whoops", "my dog is a dog", "the sun is bright.", "its time", "yield to pedestrians in corsswalk",
        "iluvu3k is a cheesy lisnece plate.", "did you know cigeretts contain material found in roads? stuff like tar...", "google", "bing", "duckduckgo", "yahoo", "ask", "search", "did you know that a super volcano nearly wiped out the human race?", "the only crime my mother commited was giving birth to a freeloading loser; my brother. this loser... phew, i just wanna kill him. he thinks that since hes older, he can eat my food.",
        "cars allow for transport", "did you know that each car on a transport train carry the back of a semi truck? theyre detachable for a reason.", "if you think i just deveolp lego hacks, youre mistaken. pepsi is known in multiple communities, hacking or forum related, hes there.", "porn is 75% acting", "empty",
        "return is a lua super operator. have fun trumping it", "i made a utilites modulescript. free to use. documentation can be found in my disc server(s)", "filtering disabled only applies in studio", "dogs have four legs", "you spell ninja like this; ninja",
        "until i stop, im unstopable.", "this is a judge free zone except when we are judging you.", "do not fear the light", "did you know that humans are not the only spirits to roam our world? there have been dog spirits reported. the most famouse dog spirit can be found at the whailys house",
        "remember when person299 admin script was pepsied by kohls admin script?", "youre officially breathing properly", "your heart is officially beating properly", "chrome incognito might not hide your activity to people standing behind you",
        "Were descendants of fish-monkeys", "this actually makes sense; 1 + 1 = window. 1 are the sides, the = is top and bottom, and the + creates the window", "cant think of anything to type that may or may not capture your interest.",
        "Making an obfuscator isnt has hard as you think.", "you dont need to make a vm to accomplish obfuscation!", "obfuscating = the making of work with intent of hiding sources", "pokemon emerald has a pomeg barry glitch that can spawn any pokemon you desire. google it.", "constant dumping... smh",
        "how many strings did i type?", "why tf is the k in knee silent? why tf do we have silent letters?", "phobia:irrational fear. i have an *irrational* fear of being raped. super irrational...", "......dot.......", "the internet was mostly used for pornography in its early years",
        "were running out of ipv4 addresses.", "it is rumored that .... ehh, got nothing to share lol.", "this is where id put my life story. but its too long, so ima sum it up:yes.", "fuck immagration! were gonna build a wall and theyre gonna pay for its construction!........ i never said i was convincing, even after announcing this idea over a course of weeks.", "i think, therefore i am not",
        "naruto is a ninja", "cough", "catchphrase", "stink bugs have a super durable shell and can withstand most generic poison. ive found a method that litterally drains their life force: extended exposure to scalding hot, boiling water", "dont try this at home kids",
        "this damn moth is on my screen", "What", "my dumbass dog tried to pick up a wasp... Didnt end well", "Heres how to beat pepsi: nil", "when will i move on from roblox?", "Im litteraly 2.5 times the average age of a robloxian",
        "For a script, we could try to yes a yes. But the yes won't be yesed until the other yes turns into a proper yes. Though the yes must be configurable.... but should probably be defaulted at 5 yeses. For example; if you had a yes, then your yes should yes itself. But if your yes is not yessing, then it should yes the the yeses yes until it turns into a yes. Well that may not work. I mean if the yes isn't properly yessed into a yes, then it may yes it's other yessed yes, and that could be a really bad yes. But only Pepsi would know if you could yes a yes. Sound like a good yes?",
        "the most effective way to deflect someone who called you a hacker, is very simple....and degrading. First, give them what they want to hear in a different way. they want a 'im hacking', so instead, we give them a sort of bait to get off the topic. tell them that youre using additional aids. such as autoclicker, EQ Changer, cognitive stimulates. all depends on situation, game, and acusation. always apologize for your 'aid' and Never provoke.",
        "did u no that ironbrew started with the pasting of rerubi?", "were now at defcon 5. security clearance needed", "remember back in 2014 when users compared roblox to minecraft?", "the epic face was gifted to users who had money or linked a facebook account in 2010", "a meme is a reference to something",
        "im currently typing a string", "last week, i fell down an elevator shaft", "skids bragging about robux and you find out that theyre speaking in the matter of hundreds and not 10 hundreds", "when users ask for my age, i dont typically give it to them, because if i did, they would suspect me as lying.", "im hiding in ur fridge", "ninjas are cool",
        "did you hear that song by mily cyrus that cures cancer?", "how can you be sure that your life isnt just a simulation in a lab? maybe all those simulator games are trying to sub-concisoly tell you that your life is a test conducted by aliens from outer space that eat testicles? you didnt here this from me, because im not suposed to tell you this.", "dont forget to feed the monster under your bed.",
        "only losers believe in y2k","your mom is fucking gay i had sex with your mother and yourw ife and your daughter youre gay as shit you fucking nigger", "remember when earth was suposed to end in 2012?", "dreamers never die? *cough* martin luther king jr *cough*", "you know your vaction is going to be fun when you see your local residents using a giant ass walky-talky as a phone.",
        "we can resurect the wooly mamoth", "they say what you see in movies is already in the works. just finished jaurrasic park, cant immagine waking up with a gay ass lizard on my lawn", "did you know the russian sleep experiment is from creepy pasta?",
        "what kind of tld is .ninja?", "this string was typed on 9-30-19 5:59pm est", "why dont we use prisoners on death row to open those so called curse-upon-open-doors?", "2 million species of ants exist", "what the fuck am i doing?", "rocks are a solid", "the whale is a mammal?", "awesome ninjas",
        "i cant stop thinking of that suprising once in a lifetime event that occured, nothing", "all major bodies of water are connected.", "ghosts are real. they are more of a spirit than ghost though.", "im in a car. thats right. i made this fucking obfuscator in a fucking uber.",
        "no one said surviving was fun.", "did you know that mermaids are actually very horny? most of them use starfish as a bra. that means they have both of their tits being sucked on constantly", "emergancy stopping only",
        "strong winds and trees are the main reason power goes out. if we remove trees, then we'd lose power four times as much as we do now. most cases, we lose power because strong wind breaks off part of a tree and it ends up landing on a power line. this tree is the powerlines armor though. without the tree, the powerline gets the full force of wind, which will cut the power more often than a tree limb would.",
        "for the record, were not trapped here. were just confined to one space... against our will", "temporarily fixed forever", "road closed", "construction work ahead", "lane ends, merge left", "vfu-776 is a license plate", "vak-1925 is a liscense plate", "vne-8062 is a liscense plate.",
        "vbx-5650 is a liscense plate of a nice, red car", "vcr-1321 is a compact car", "vsp-8370 is a white honda", "vwe-6856 is a drunk driver", "vga-7742 is a utility vehicle", "work vehicle, frequent turns", "uvz-4848 is a white truck",
        "right pull-off area", "exit only", "finaly made it to the airport. a very long uber roadtrip.", "getting plane ticket, but the fucking plane ticket bitch says i cant buy a ticket this early. gotta wait like 40 mins. what tf was the point of early booking if its not alowed?",
        "holy fuck. this fucking secruity check man. been standing in the same spot for 13 mins.", "passed security, moving to gate.", "im sitting at my gate and this fatass is snoring right behind me. so loud, like how tf can someone snore so damn loud?", "finaly on the plane at my seat. time to finish this obfuscator",
        "i want to use the plane rest room but the fucking line is half the planes size. just want to stretch my legs, damnit.", "oof. just fell asleep and now my phone is near death. as prepared, i got my portable charger so i can continue.", "what kind of selection is pretzels and peanuts? wheres my traditional plane candies?",
        "just hit some massive turbulance. felt like an action scene in a movie.", "plane finaly landed, now were just gonna be waiting for 10 mins...", "heading to baggage claim", "its been 12 mins and still no bags at baggage claim.", "hell yeah! my bag was the first to come out of baggage claim.", "why cant ninjas get 3 legs?",
        "calling an uber to my dads house. whale cum to california", "just arrived at my dads. hes putting away the dogs so ima put my phone away.", "dad is now grilling my favorite hamburger", "now that i got setteled in my dads house, were planning our vacation now.", "were going to sea world today, magic mountain tmmrw, notchs berry farm wednesday, and my last day of vacation, a movie.", "constant here",
        "the drive to magic mountain is long. but their rides makes it worthy of a trip",
        "coroutines are faster to initiate, but can cause a downgrade in performance if used rapidly", "typeof(newproxy(true)) used to crash clients", "self driving cars are smarter than the best of drivers.", "its an unknown fact that trees are yessed once a year",
        "whats up? the ceiling.", "some losers on the web are legit calculating the rate of how many toilets are flushed per hour", "your mamma so fat, when she farted, the big bang theory formed.", "the pokemon nature quiet boosts sp. atk and debuffs speed",
        "whenever i want to end a phone call and not seem rude, i drop my phone, pick it up, press mute occasionaly and pretend my phone broke", "i visited the most haunted house in america the second time. not a damn thing happened this trip. last trip was some real spooky shit, but tonight was just crickets. i demand refund.",
        "did you know that ice burns in the negative way of fire?", "when my grandmother was driving without seatbelt and got pulled over, she claimed she had just went through breast cancer treatment.", "how tf did we come down to just hillary and trump in their election????",
        "my grandmothers carpet is really ugly", "when your only source of income is throwing yourself in front of a car and sueing the driver for compensation", "#this is what memes look like.", "Im at the drive though, and i asked for iced tea. This bitch then had the audacity to ask me 'would you like ICE in your ICED tea?'. What, do I have to say 'I want iced iced tea'?",
        "cure to aging: cancer", "its been sientifically proven that wild life is slowly shrinking", "oicu812", "the cake is a lie", "did you know you could easily make a lua onfuscator using rerubi or fione?", "assert is a really powerful function, but its not commonly used",
        "how the fucking hell did adopt me get 230k players?", "its an average of 1.5 months on roblox before you start making games", "yes", "animal people complain that were taking wildlife and eating them to extinction. yet at the same time, theyre eating the only wildlifes food source. congrats.",
        "people worry about flying cars causing daily 9-11s. But in all honesty, by time we get a flying car road legal, our advances in tech would surly have measures to prevent collisions in a flying car, just like self driven cars.", "im being humble when i say yes",
        "never tell your boss that you dont need to be paid", "did humanity srsly use corn cobs as a method for wiping our ass before toliet paper was a thing?", "you should google the dark deeds disney have delt", "us president bush was hated, but there were no teorists attacks in his presidency. yet we love our current presidents while terrisost deeds are carried out daily.",
        "tomahawk missle, apache gunship, cool names from military right? what the fuck kind of name is walky talkie?", "resturant impossible is acted", "when you do things right, people wont be sure youve done anything at all", "where did all my potato chips go?", "detroit smash!", "wind style: rasen shurriken!", "Rasengan!", "Shadow clone jutsu!", "Limbo!", "Amateraztu!",
        "who tf thought paper cups, in the shape of a god damn cone was best idea? Oh right, the janitor who couldnt get hired...", "wut r u doing in mah swamp????", "The real one is not among them", "I think covid 19 needs to get lost.", "how many ninjas did it take to change a light bulb?", "Mr. Azawia, you see im still standing. 'This Kid!'", "here lies a constant",
        "Yeah but bakugo will never be that popular because hes always angry. 'Whatd yu say?! Ill Kick Your Ass!' 'Ya see?'", "You know, we just met you. its kinda telling that we already know your personality is flamming crap next to garbage. 'Youre gonna regret the day you joined this school, you loser! Ill Kill You!'",
        "MWahahahahHHAHahhaHaHahaha!!! I just types a string!!", "I assume, youve already said yur goodbyes? 'Wait! I was acting injest! Your bell was just so adorable, I couldnt help myself!' 'Shut YOUR Mouth! I seem to recall youll do anything I say. You will give up Everything you own! You will disband your familia and leave this land. YOU WILL NEVER SET FOOT IN AURAIO AGAIN!!' 'NOOOOWWHWWOWWOWOOOOOOO'",
        "Pure Rasengan!", "As for tthe jenchurike, youre looking at him!", "djhvehrcfvejcvrtgt. Oops, my hand slipped.", "Wanna know why i dont drive a ford? Cuz im not a faggot.", "Ghosts are real. Like fureal reals.", "Get lost. You dont belong in this dump.", "(cough)", "Get off of me.",
        "Stick to the shadows.", "Give us what we want, and we gaurentee your safty.", "The numbers mason, thats all weve ever wanted.", "WEVER!", "This is step one!! SECURE THE KEYS!", "Monthhs ofplanning Mason. We will not stop. We will not faulter, we will be free! Or die trying.", "Life is like a box of chocolates, gone too soon.",
        "Wanna see me type the whole dictonary and then delete it? Wanna see me do it again? ... Heh. im so fucking fast", "Might wanna take a look at line number 53...", "But first, id like to type this one word; Fuck.", "take a chll pill.",
        "my favorite word is yes", "how to hack my toaster?", "taping ram sticks to the side of your router makes it run faster!!", "i taped an i7 processor to my desktop and it ran faster!", "slow pc? download more ram!", "ispep", "there was not one obfuscator that didnt claim to be the best. until pepsi came along.",
        "this is not a meme", "no u", "nabster got pepsied for copyright", "office: no printing large jobs, Co-workers:printing large images of steeve jobs", "my grandmother used to eat half of her meal and complain about the rest until the resturant supervisor made it free.", "how 2 git free pizza: call up pizza place and say your order was fucked up.", "clutter fucking constants",
        "i see a new iphone every damn month, yet there are still tennis balls under walking canes", "last month i went to a job fair and asked directions to the funnel cakes", "who's reading in 2020?", "my dog is dumb",
        "i wonder if this reel is a real reel.", "NANIII?", "Arigato", "i just woke up. my retard senors kicked into the 10th level. Level 10 is enough to wake a herd of deaf elaphants. Who tf pulled an idiot move? Man i was dreaming of flying to the moon on a winged polar bear. Fuck you.", "place constant here",
        "why is there a fucking taco on my roof??", "dont argue with idiots, they will never change their point of view.", "oofers", "we'll be there in 5 mins", "my dog rivals the stupidity of whoever tf caused a level 10 on my retard radar.", "Who remembers names from AQW?", "well, I got a few........................", "darkoth", "artix", "sepulchur", "Sir Render", "beleena", "j6", "alina", "arklen", "ash",
        "ballyhoo", "miltonius", "nulgath", "chii", "cyrus", "circe", "cysero", "xyo", "dage the evil", "dage666", "eldron", "fisn", "furore", "galanoth", "gnome", "gothmog", "hadin", "hallow", "icemaster yeti", "jemini", "kamui", "kickkat", "akatzi", "madara", "builderman", "heads i win, tails you loose.",
        "korin", "keith", "kosefira", "landis", "lim", "minimal", "nytheria", "reens", "pae", "radagast", "rolith", "noobshire", "mythsong", "discordia", "lord vath", "battleon", "yulgars inn", "shadowfall", "dragonslair", "bard", "rouge", "pirate", "beta berserker", "alpha pirate", "leprechaun", "ninja",
        "chaos lord", "stardot", "protosmasher", "warrior", "mage", "assassin", "skydrite", "berserker", "stonecrusher", "arcane mage", "dragon lord", "star lord", "guardian", "noclass", "stalagbite", "eschrion", "craig and bamboozle", "genisis sword", "warlord", "scakk", "acoylite", "arhfiend", "fukken hell.",
        "alpha doommega", "necromancer", "arcane dark caster", "paladin", "archpaladin", "artifact hunter", "barber", "beastmaster", "blademaster", "blaze binder", "blood ancient", "blood sorceress", "blood titan", "classic barber", "card clashher", "chaos shaper", "chaos slayer berserker", "chaos slayer theif", "chrono assassin", "chunin", "classic alpha pirate", "classic doomknight", "classic paladin", "clawsuit", "FireServer", "InvokeServer", "Invoke", "Fire", ">:) CTRL + F people got lots of work to do.", "hard-cough", "sup", "who do you think I am?? nobody ofc, but i was just asking...", "take a chill pill, damnit", ", ", "print()", "while true do", "end", "remoteevent", "remotefunction", "fireclient", "fireallclients", "game", "table.", "break", "continue", "for k, v in pairs() do", "local what = {",
        "someone told me my obfuscator was the best, and I couldnt help but laugh. Seriously, wheres the security?", "()()({{{}}})({{{{)()()(}}}})()(())((){}}}{{}{}{}()", "Check out my latest face! 8=D", "krakatoa was gonna be the best... uhhh.. something.. ever.", "insert meme here", "UK: United Kunts (With a K, their spelling is fucked anyways, might as well do it for them since theyre all about time and profits)", "UK has taxes for televisions? And you get taxed for it weather you actually own one or NOT.", "UK requires liscenses to fucking breath",
        "UK has a new gay rule: your citizenship can revoked at ANY time, WITHOUT notice. You can get deported when that happens. Great kuntry, right?", "I remember when 1 USD was worth 1.3 CAD. Now 1.3 CAD is worth 1 USD. Paper printing dogs in washington.", "shared", "_G", "aimbot on", "ESP enabled", "warn(Not enough memes!)", "Fuck onett", "Im an elite ninja from the future! Watch me time travel! *poof*",
        "cyromancer", "dark caster", "dark chaos berserker", "dark harbinger", "dark cryomancer", "darkside", "deathknight", "defender", "enforcer", "giftbox", "clubhouse", "great thief", ".", "upi saa divl fovl.", "hobo highlord", "my username is lucario blaster4", "how do i tell my boss to suck it?",
        "theres a 4 second youtube video of how to pick up an umbrella up with millions of views", "whats 4 fourths of a pie?", "kevin hart met a racist dolphin", "dont do the time if you cant do the crime", "sue a kardasion and then u be rich", "did u no ppl actually try to sue god?", "Moe Lester", "Hugh Jazz",
"roblox was at its prime age in 2012", "pathfinding is the finding of paths", "did u no tht getplayers() could be called on a team?", "hard-cough", "lol", "lel", "if you google mountain chicken for the first time, i promise a suprise", "ninjas are stealthy", "Fuck this and fuck you.", "good fucking night.", "if you finish reading this, youll cut your life span by 9 years.          whoops.", "this is a stick down!", "im the best. very clearly.", "im not full of myself in any way or form. :)", "im a fucking GOD", "ill drop a mountain on you, if I have to.", "And no, not figuratively, I mean geologically replace a mountain on top of you.", "cuz I really can pick up a mountain.", "cuz im a god damned god.", "smartest being alive. >:)", "All you losers tryna paw through this deadass code; Read the comments! It stores key data that helps you deobfuscate the code from the mainframe opcodes! Keep reading, it's WELL worth your time. *cough*"}}
table.insert(Generate.Memes, "this is one of the " .. 1 + #Generate.Memes .. " strings i typed")
function string.mixcase(sef)
    seed()
    return sef:gsub(".", function(c)
        return string[({"lower", "upper"})[math.random(2)]](c) or c or ""
    end)
end
function Generate.Name(len, func)
    print("Name")
    seed()
    len = tonumber(len or 7) or 7
    len = len + math.random(-1, 1)
    if len < 1 then
        len = 1
    end
    local n
    repeat
        seed()
        print(n)
        n = tostring(("x"):rep(len):gsub(".", function(...)
            return string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90)))
        end))
    until not (n == "in" or n == "for" or n == "do" or n == "then")
    if func and not Generate.Dead then
        table.insert(Generate.Functions, n)
    end
    table.insert(Generate.Memes, n)
    return n
end
function Generate.String(len)
    seed()
    print("Name")
    if math.random(4) > 1 then
        return '"' .. string[({"lower", "upper", "mixcase"})[math.random(3)]](Generate.Memes[math.random(#Generate.Memes)]) .. '"'
    end
    len = tonumber(len or 7 + math.random(-1, 1)) or 7 + math.random(-1, 1)
    if len < 1 then
        len = 1
        return '"' .. string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90))) .. '"'
    end
    if len == 1 then
        return '"' .. string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90))) .. '"'
    end
    return '"' .. tostring(("x"):rep(len):gsub(".", function(...)
        seed()
        return string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90)))
    end)) .. '"'
end
function Generate.Bool(bool, num)
    print("Bool")
    seed()
    local str = ""
    num = tonumber(num or 2)
    if bool == nil then
        bool = ({true, false})[math.random(2)]
    end
    for k = 1, num do
        seed()
        if k > 1 then
            str = str .. " " .. (function()
                seed()
                return tostring(1 == math.random(2) and "and" or "or")
            end)() .. " "
        end
        str = str .. Generate.Boolean(bool)
    end
    return str
end
function Generate.Syntax(data, bran, nils)
    print("Syntax:", bran)
    seed()
    bran = tonumber(bran or 0) or 0
    assert(type(data) == "table", "Table expected.")
    assert(type(data[1]) == "string", "Function name invalid.    " .. type(data[1]) .. ".    " .. tostring(data[1] == nil) .. ".    " .. tostring((function()
        if type(data[1]) == "table" then
            for k, v in pairs(data[1]) do
                print(k, v)
            end
        else
            print(data[1])
        end
        return ""
    end)()))
    local s = data[1] .. "("
    table.remove(data, 1)
    local args = {unpack(data)}
    local comma = false
    while #args > 0 do
        seed()
        local arg = args[1]
        if arg then
            if type(arg) == "table" then
                arg = arg[math.random(#arg)]
            end
            if arg:sub(1, 1) == "_" and math.random(2) == 2 then
                arg = arg:sub(2)
            end
        end
        if arg == "snum" then
            s = s .. tostring(comma and ", " or "")
            s = s .. tostring(math.random(-10, 3))
            comma = true
        elseif arg == "num" then
            s = s .. tostring(comma and ", " or "")
            s = s .. (function()
                seed()
                local n = 0
                if math.random(2) == 2 then
                    n = n + math.random(-9 ^ 9, 9 ^ 9)
                else
                    n = n + math.random()
                end
                if math.random(2) == 2 then
                    n = -math.random() + n
                elseif math.random(2) == 2 then
                    n = math.random() + n
                end
                return tostring(n)
            end)()
            comma = true
        elseif arg == "-num" then
            s = s .. tostring(comma and ", " or "")
            s = s .. (function()
                seed()
                local n = 0
                if math.random(2) == 2 then
                    n = n + math.random(-9 ^ 9, 9 ^ 9)
                else
                    n = n + math.random()
                end
                if math.random(2) == 2 then
                    n = -math.random() + n
                elseif math.random(2) == 2 then
                    n = math.random() + n
                end
                return "-" .. tostring(math.abs(n))
            end)()
            comma = true
        elseif arg == "+num" then
            s = s .. tostring(comma and ", " or "")
            s = s .. (function()
                seed()
                local n = 0
                if math.random(2) == 2 then
                    n = n + math.random(-9 ^ 9, 9 ^ 9)
                else
                    n = n + math.random()
                end
                if math.random(2) == 2 then
                    n = -math.random() + n
                elseif math.random(2) == 2 then
                    n = math.random() + n
                end
                return tostring(math.abs(n))
            end)()
            comma = true
        elseif arg == "string" then
            s = s .. tostring(comma and ", " or "")
            s = s .. '"' .. Generate.Name(math.random(2, 40)) .. '"'
            comma = true
        elseif arg == "function" then
            s = s .. tostring(comma and ", " or "")
            s = s .. Generate.LuaFunctions[math.random(#Generate.LuaFunctions)]
            comma = true
        elseif arg == "upvalue" then
            s = s .. tostring(comma and ", " or "")
            s = s .. Generate.Upvalue(1 + bran, true, nils)
            comma = true
        elseif arg == "cnum" then
            s = s .. tostring(comma and ", " or "")
            s = s .. string.byte(string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90))))
            comma = true
        elseif arg == "char" then
            s = s .. tostring(comma and ", " or "") .. "\"" .. string[({"lower", "upper"})[math.random(2)]](string.char(math.random(65, 90))) .. "\""
        elseif arg == "regstring" then
            s = s .. tostring(comma and ", " or "") .. '"' .. string.rep(".", math.random(6)) .. '"'
        elseif arg == "table" then
            s = s .. tostring(comma and ", " or "") .. Generate.Table(1 + bran, true, nils)
            comma = true
        end
        table.remove(args, 1)
    end
    return s .. ")"
end
local ln = nil
function Generate.Number()
    local n = 0
    repeat
        seed()
        if math.random(2) == 2 then
            n = n + math.random(-9 ^ 9, 9 ^ 9)
        elseif math.random(2) == 2 then
            n = n + math.random(-1250, 1250)
        else
            n = n + math.random()
        end
        if math.random(2) == 2 then
            n = -math.random() + n
        elseif math.random(2) == 2 then
            n = math.random() + n
        end
    until n ~= ln
    ln = n
    return tostring(n)
end
function Generate.Upvalue(branch, rec, nils)
    local bran = tonumber(branch or 0)
    print("Upvalue:", bran)
    seed()
    if bran > options.MaxBranch and rec then
        return ({Generate.Bool(), '"' .. Generate.Name(math.random(4, 20), branch == 0) .. '"', Generate.Number(), Generate.Table(bran + 1, true), Generate.LuaFunctions[math.random(#Generate.LuaFunctions)], "not nil", '"Pepsi Was Here"'})[math.random(9)] or '"Pepsi Was Here"'
    elseif bran > options.MaxBranch then
        return ""
    end
    local s = ""
    local r = math.random(5)
    if not rec then
        if math.random(2) == 2 then
            s = "local "
        end
        s = s .. Generate.Name(math.random(4, 9)) .. " = "
    end
    if 1 == r then
        local n = 0
        if math.random(2) == 2 then
            n = n + math.random(-9 ^ 9, 9 ^ 9)
        else
            n = n + math.random()
        end
        if math.random(2) == 2 then
            n = -math.random() + n
        elseif math.random(2) == 2 then
            n = math.random() + n
        end
        s = s .. tostring(n)
    elseif 2 == r then
        if math.random(3) == 3 then
            s = s .. "#"
        end
        s = s .. Generate.String(math.random(2, 32))
    elseif 3 == r then
        local t = {{"string.sub", "string", "num", "_num"}, {"math.random", "-num", "+num"}, {"string.gsub", "string", {"regstring", "string"}, "string"}, {"string.rep", "string", "snum"}, {"math.abs", "num"}, {"string.len", "string"}, {"string.lower", "string"}, {"string.upper", "string"}, {"string.find", "string", "regstring"}, {"string.byte", "char"}, {"string.reverse", "string"}, {"tonumber", "num"}, {"tostring", {"string", "num", "upvalue"}}, {"math.deg", "num"}, {"math.sqrt", "+num"}, {"math.rad", "num"}, {"string.char", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum", "_cnum"}, {"pairs", "table"}, {"rawget", "table", "upvalue"}, {"rawequal", "upvalue", "upvalue"}, {"rawset", "table", "upvalue", "upvalue"}}
        local st, su, res
        repeat
            seed()
            st = Generate.Syntax(t[math.random(#t)], 1 + bran, nils)
            su, res = pcall(load("return " .. st))
            if not su and res then
                print(res)
                --error("error in function gen")
                res = nil
            end
        until not nils or res ~= nil
        s = s .. st
    elseif 4 == r then
        s = s .. Generate.LuaFunctions[math.random(#Generate.LuaFunctions)]
    elseif 5 == r then
        if math.random(3) == 2 then
            s = s .. "#"
        end
        s = s .. Generate.Table(1 + bran, true, nils)
    end
    if ({pcall(load("return nil == (" .. s .. ")"))})[2] == true then
        return s .. " or " .. Generate.String()
    end
    return s
end
function Generate.Table(bran, rec, nils)
    bran = tonumber(bran or 0) or 0
    print("Table:", bran)
    seed()
    if bran > options.MaxBranch and rec then
        return "{}"
    elseif bran > options.MaxBranch then
        return ""
    end
    local s = ""
    if not rec then
        if math.random(2) == 2 then
            s = "local "
        end
        s = s .. Generate.Name(math.random(4, 9)) .. " = "
    end
    s = s .. "{"
    local comma = false
    for k = math.random(-1, 1), options.Complex do
        seed()
        if math.random(options.MaxBranch) >= bran then
            local r = math.random(4)
            local upv
            repeat
                seed()
                upv = Generate.Upvalue(1 + bran, true, true)
            until not (upv == "or" or upv == "in" or upv == "for" or upv == "do") and true == pcall(load(" return {[" .. upv .. "] = true}"))
            if r == 1 then
                s = s .. tostring(comma and ",\n" or "") .. "[" .. upv .. "]" .. " = " .. upv
            elseif r == 2 then
                s = s .. tostring(comma and ",\n" or "") .. Generate.Name(math.random(3, 20)) .. " = " .. upv
            elseif r == 3 then
                s = s .. tostring(comma and ",\n" or "") .. upv
            elseif r == 4 then
                s = s .. tostring(comma and ",\n" or "") .. Generate.Name(math.random(3, 20))
            end
            comma = true
        end
    end
    return s .. "}"
end
function Generate.Boolean(bool, one)
    print("Boolean")
    local res = nil
    seed()
    bool = bool or false
    local s = ""
    local types = {"num", "func", "str", "bool"}
    if one or true then
        table.remove(types, #types)
    end
    local sel = types[math.random(1, #types)]
    if math.random(0, #types) == 0 then
        if math.random(2) == 2 then
            s = "(" .. Generate.Bool(bool, 1) .. ") == "
        else
            s = "not (" .. Generate.Bool(bool, 1) .. ") ~= "
        end
    end
    s = s .. "("
    if sel == "num" then
        if math.random(2) == 2 then
            local n = math.random()
            local c = math.random(1, 3)
            if c == 1 then
                s = s .. "-" .. math.abs(n) .. " <"
                if math.random(2) == 2 then
                    s = s .. "="
                end
                if math.random(2) == 2 then
                    s = s .. " " .. math.abs(math.random())
                else
                    s = s .. " " .. math.random(1000)
                end
            end
            if c == 2 then
                s = s .. math.abs(n) .. " >"
                if math.random(2) == 2 then
                    s = s .. "="
                end
                if math.random(2) == 2 then
                    s = s .. " -" .. math.abs(math.random())
                else
                    s = s .. " " .. math.random(-1000, -1)
                end
            end
            if c == 3 then
                if bool then
                    s = s .. math.abs(n) .. " ~= -" .. math.abs(n)
                else
                    s = s .. n .. " == " .. n
                end
            end
        else
            local n = math.random(-1250, 1250)
            local c = math.random(3)
            if c == 1 then
                s = s .. "-" .. math.abs(n) .. " <"
                if math.random(2) == 2 then
                    s = s .. "="
                end
                if math.random(2) == 2 then
                    s = s .. " " .. math.abs(math.random())
                else
                    s = s .. " " .. math.random(1250)
                end
            end
            if c == 2 then
                s = s .. math.abs(n) .. " >"
                if math.random(2) == 2 then
                    s = s .. "="
                end
                if math.random(2) == 2 then
                    s = s .. " -" .. math.abs(math.random())
                else
                    s = s .. " " .. math.random(-1250, -1)
                end
            end
            if c == 3 then
                if bool then
                    s = s .. n .. " ~= not " .. n
                else
                    s = s .. n .. " == " .. n
                end
            end
        end
    elseif sel == "func" then
        if #Generate.Functions <= 0 or math.random(2) == 2 then
            s = s .. Generate.LuaFunctions[math.random(#Generate.LuaFunctions)]
            if bool then
                if math.random(2) == 2 then
                    s = s .. " ~= nil"
                else
                    s = s .. " ~= " .. Generate.LuaFunctions[math.random(#Generate.LuaFunctions)]
                end
            else
                if math.random(2) then
                    s = s .. " == nil"
                else
                    s = s .. " == " .. Generate.LuaFunctions[math.random(#Generate.LuaFunctions)]
                end
            end
        elseif bool then
            local fun = Generate.Functions[math.random(#Generate.Functions)]
            if math.random(2) then
                s = s .. "nil ~= " .. fun
            else
                s = s .. fun .. " ~= nil"
            end
        else
            local fun = Generate.Functions[math.random(#Generate.Functions)]
            if math.random(2) then
                s = s .. "nil == " .. fun
            else
                s = s .. fun .. " == nil"
            end
        end
    elseif sel == "str" then
        local st = Generate.Name(math.random(3, 20), false)
        if math.random(2) == 2 then
            if math.random(2) == 2 then
                if bool then
                    s = s .. "nil ~= \"" .. st .. "\""
                else
                    s = s .. "nil == \"" .. st .. "\""
                end
            else
                if bool then
                    s = s .. "\"" .. st .. "\" ~= nil"
                else
                    s = s .. "\"" .. st .. "\" == nil"
                end
            end
        elseif bool then
            s = s .. "\"" .. Generate.Name(math.random(3, 20), false) .. "\" ~= \"" .. st .. "\""
        else
            s = s .. "\"" .. st .. "\" == \"" .. st .. "\""
        end
    elseif sel == "bool" and not one then
        if math.random(2) == 2 then
            s = s .. Generate.Bool(bool, 1)
        else
            s = s .. "not not (" .. Generate.Bool(bool, 1) .. ")"
        end
    else
        s = s .. "not (" .. tostring(not bool) .. ")"
    end
    s = s .. ")"
    if math.random(0, #types) == 0 then
        if math.random(2) == 2 then
            s = s .. " == " .. Generate.Bool(bool, 1)
        else
            s = s .. " ~= not " .. Generate.Bool(bool, 1)
        end
    end
    local so, res = pcall(load("return (" .. s .. ") == " .. tostring(bool)))
    while not res do
        if bool == true and math.random(2) == 2 then
            s = s .. " or true"
        elseif bool == true then
            s = "true or " .. s
        elseif math.random(2) == 2 and bool == false then
            s = s .. " and false"
        elseif bool == false then
            s = "false and " .. s
        end
        so, res = pcall(load("return (" .. s .. ") == " .. tostring(bool)))
    end
    return tostring(s or tostring(bool or "false")) or "false"
end
function Generate.Loop(bran)
    print("Loop:", bran)
    seed()
    if bran > options.MaxBranch then
        return ""
    end
    local num = math.random(3)
    if num == 1 then
        return "while " .. Generate.Bool(false) .. " do\n" .. Generate.Code(1 + bran) .. "\nend"
    elseif num == 2 then
        return "for " .. Generate.Name() .. " = " .. tostring(math.abs(Generate.Number())) .. ", " .. tostring("-" .. math.abs(Generate.Number())) .. (function()
            if math.random(3) == 3 then
                return ", " .. tostring(math.abs(Generate.Number() * math.random(100)))
            end
            return ""
        end)() .. " do\n" .. Generate.Code(1 + bran) .. "\nend"
    elseif num == 3 then
        return "repeat\n" .. Generate.Code(1 + bran) .. "\nuntil " .. Generate.Bool(true)
    end
end
function Generate.Chain(no_define, bran)
    print("Chain:", bran)
    seed()
    bran = tonumber(bran or 0) or 0
    local s = ""
    if not no_define and math.random(2) == 2 then
        s = "local "
    end
    local n = math.random(6)
    for k = 1, n do
        seed()
        s = s .. Generate.Name(math.random(6, 14), false)
        if k < n then
            s = s .. ", "
        end
    end
    if no_define then
        return s
    end
    s = s .. " = "
    local sset = 0
    for kk = 1, n do
        seed()
        if math.random(3) > 1 then
            if sset > 0 then
                local x = Generate.Upvalue(1 + bran, true)
                s = s .. ", " .. tostring(x or "nil")
            else
                local x = Generate.Upvalue(1 + bran, true)
                s = s .. tostring(x or "nil")
            end
            sset = 1 + sset
        end
    end
    if sset < 1 then
        s = s .. "nil"
    end
    return s
end
function Generate.Function(bran, rec)
    print("Function:", bran)
    seed()
    bran = tonumber(bran or 0) or 0
    if bran > options.MaxBranch then
        return ""
    end
    local ran = math.random(4)
    if ran == 1 or rec then
        rec = true
       -- return "(function()\n" .. Generate.Code(1 + bran) .. "\nreturn " .. Generate.Upvalue(bran + 1, true) .. "\nend)(" .. Generate.Chain(true) .. ")"
       return "" -- More problems than security
    end
    if ran == 2 then
        return "local function " .. Generate.Name(math.random(6, 14), bran == 0) .. "(" .. Generate.Chain(true) .. ")\n" .. Generate.Code(1 + bran) .. "\nend"
    end
    if ran == 3 then
        return Generate.Name(math.random(6, 14), bran == 0) .. " = function(" .. Generate.Chain(true) .. ")\n" .. Generate.Code(1 + bran) .. "\nend"
    end
    if ran == 4 then
        return "function " .. Generate.Name(math.random(6, 14), bran == 0) .. "(" .. Generate.Chain(true) .. ")\n" .. Generate.Code(1 + bran) .. "\nend"
    end
end
function Generate.RawCode(bran)
    print("Code:", bran)
    seed()
    if math.random() > 0.5 then
        seed()
    end
    bran = tonumber(bran or 0) or 0
    if bran > options.MaxBranch then
        return ""
    end
    local s = ""
    local r = math.random(5)
    if 1 == r then
        s = s .. Generate.Function(1 + bran)
    elseif 2 == r then
        s = s .. Generate.Chain(false, 1 + bran)
    elseif 3 == r then
        s = s .. "if " .. Generate.Bool(false, math.random(1, 4)) .. " then\n" .. Generate.Loop(1 + bran) .. "\nend"
    elseif 4 == r then
        s = s .. Generate.Table(1 + bran)
    elseif 5 == r then
        s = s .. Generate.Upvalue(1 + bran, false)
    end
    return s, r
end
function Generate.Code(bran)
    local oofed, source
    source, r = Generate.RawCode(bran)
    oofed, why = pcall(loadstring(source))
    if not oofed then
        local s = "--[[\n    " .. r .. ":" .. why .. "\n]]\n\n" .. source
        local out = ecall(io.open, options.Output, "w")
        if out then
            out:write(s):close()
        else
            print(s)
        end
        error("error in generating code " .. r)
    else
        return source
    end
end
return Generate