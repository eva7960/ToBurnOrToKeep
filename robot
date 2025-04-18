label intro_robot:
    default name = "TR-87"
    $ current_visitor = "robot"
    default isTR = True
    "You hear some clunks against the door."
    "\"Scanning.\""
    menu:
        "Who are you?":
            "\"I am model TR-87.\""
            menu:
                "Let them in":
                    jump ask_robot
                "Stay silent":
                    george "..."
                    "\"Life form detected.\""
        "Stay silent":
            george "..."  
            "\"Life form detected.\""
            menu:
                "Who are you?":
                    "\"I am model TR-87.\""
                    menu:
                        "Let them in":
                            jump ask_robot
                        "Stay silent":
                            george "..."
                            "\"...\""
                            "You hear metal feet walking away."
                            $ humanity -= 10
                            jump next_day
                "Stay silent":
                    george "..."
                    "\"...\""
                    "You hear metal feet walking away."
                    $ humanity -= 20
                    jump next_day

label ask_robot:
    $ r += 1
    $ humanity += 10
    "You open the door to see a metal robot standing in the doorway with a folder in its hand."
    "It's missing an arm."
    "The robot steps inside and you close the door behind it."

    george "...can I help you?"

    tk "Hello George. Can you tell me where the nearest facility is?"

    george "Facility? Like a bathroom? Can you even use those?"
    george "And how do you know my name?"

    tk "I know every resident in this town and I am in search of the nearest GenCore Reserach Lab, not a bathroom."

    george "Apologies yes of course I absolutely know what that is and did not think a robot as fine as yourself was asking for such services."

    tk "..."

    george "..."
    george "But anyway, I've never heard of this place in my life and I doubt it's still around that bomb dropped."

    tk "..."

    george "Well no need to stand there, take seat if you'd like."
    
    pause 3.0

    while True:
        george "Well this is awkward."
        $ q_rk = renpy.input("Should I should ask about {b}{size=+10}what happened{/size}{/b}, their {b}{size=+10}name{/size}{/b}, or the {b}{size=+10}folder{/size}{/b}.").strip().lower()

        if q_rk == "what happened":
            george "So what happened to you? How did you survive the bomb?"
            if isTR:
                tr "I am part of the GenCore Research Lab."
                tr "My memory only recalls booting up and seeing walls and rubbish everywhere."
                tr "I scanned for survivors and the results were 0."
                tr "I emerged from the building remains and have been walking and scanning for lifeforms."
                tr "It has been 9 days, 18 hours, 231 minutes and I need to find a charge pod."
            else:
                tr2 "I am part of the GenCore Research Lab."
                tr2 "My memory only recalls booting up and seeing walls and rubbish everywhere."
                tr2 "I scanned for survivors and the results were 0."
                tr2 "I emerged from the building remains and have been walking and scanning for lifeforms."
                tr2 "It has been 9 days, 18 hours, 231 minutes and I need to find a charge pod."

            george "How long do you have until your battery dies?" 
            if isTR:
                tr "I will shut down on day 15."
            else: 
                tr2 "I will shut down on day 15."
            george "Oh..."
     
        elif q_rk == "name": 
            george "How did you get your name?"
            tr "It is my model number."
            george "Do you ever think of changing it?"
            tr "... sometimes."

            george "What would you change it to?"
            tr "I do not know."
            george "Hmm... what if I gave you a name?"
            tr "What name would you give me?"
            $ newName = renpy.input("What name would suit TR-87?")
            if newName == "tr-87" or "tr87):
                tr "You think my name suits me?"
                tr "..thank you"
                "TR-87 seems content."
            else:
                $ name = newName
                george "What about [name]?"
                tk "[name]?"
                tk "..."
                tk "I think I like that."
                "[name] seems happy about their new name."
                $ isTR = False
                default tr2 = Character([name])
            $r += 3
            
        elif q_rk =="folder": 
            george "What's that folder you got there?"

            if isTK:
                tk "When I booted up I went to the officers' office."
                tk "No one was there."
                tk "I found on a folder on the ground with my name."
                tk "I have a whole database of information on other people."
                tk "But this is the only information I have of myself."
                tk "This contains the instructions to build more models like me."
                tk "I now know when I was created, by who, what my purpose is, the trial and error of making me, everything."
            else:
                tk2 "When I booted up I went to the officers' office."
                tk2 "No one was there."
                tk2 "I found on a folder on the ground with my name."
                tk2 "I have a whole database of information on other people."
                tk2 "But this is the only information I have of myself."
                tk2 "This contains the instructions to build more models like me."
                tk2 "I now know when I was created, by who, what my purpose is, the trial and error of making me, everything."
            george "What do you do?"

            if isTK:
                tk "I was a trial of a military robot."
                tk "They were in the process of adding a weapon modification to my arm but when I must have lost my arm when the bomb dropped."
                tk "... my status is better because 
            
           
        else:
            "They didn't understand your question."
        menu:
            "Ask something else":
                pass  
            "Stop asking":
                call fire
                jump fire_robot

label fire_robot:
    default burnedPhoto = False
    default burnedBear = False
    default day1Items = 0
    call furnance
    grace "Oh um.. we don't have much but let's see.."
    grace "The only thing in my purse are some photos..."
    "Grace starts to tear up."
    grace "I have some photos of our family before my husband passed away a year ago."
    "As Grace looks at the photo, Liam also looks around before his eyes land on the teddy bear in his hands."
    "He hesitates and looks a bit sad before stretching his arms out, presenting the teddy bear to you."
    grace "Oh Liam it shouldn't come to that"
    grace "... right?"

    call inventory
    while $ dayItems < 2:
        $ b_mom = renpy.input("Should I burn Grace's {b}{size=+10}photo{/size}{/b}, Liam's {b}{size=+10}teddy bear{/size}{/b}, or something of {b}{size=+10}mine{/size}{/b}?")
        if b_mom == "photo" and burnedPhoto == False:
            jump burn_grace_photo
            "While you appreciate Grace's sacrifice, you realize it won't be enough to keep the fire going the entire night."
            "You need to burn something else."
        elif b_mom == "teddy bear" and burnedBear == False:
            jump burn_teddy
            "While you appreciate Liam's sacrifice, you realize it won't be enough to keep the fire going the entire night."
            "You need to burn something else."
        elif b_mom == "mine":
            jump burn_mine
        else:  
            "You already burned that."
    call sleep
       
label burn_grace_photo:
    $ dayItems += 1
    $ burnedPhoto = True
    grace "I understand."
    "Grace sadly stares at the last photos of her family all togehter, making sure to memorize every detail of her husband."
    "After a few moments and a deep breath, Grace sets the photos into the furnance."
    "The fire quickly eats up the photos, melting the faces together."
    $ g -= 2
    $ humanity -= 5

label burn_teddy:
    $ dayItems += 1
    $ burnedBear = True
    "Liam instantly clutches his teddy bear tight against his chest as you reach for it."
        "You can tell he's upset at the thought of losing his favorite stuffed animal."
        "You reach your hand out towards Liam and after a few minutes Liam slowly hands you his teddy bear."
        "You toss it in the fire, and watch as Liam's tears run down his cheeks."
        $ l -= 4
        $ humanity -= 5





