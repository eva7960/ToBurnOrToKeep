label intro_robot:
    default name = "TR-87"
    $ current_visitor = "robot"
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
    "You open the door to see a metal robot standing in the doorway with a folder in its hand."
    george "...can I help you?"

    
    pause 3.0

    while True:
        # Get input from the user
        $ q_mom = renpy.input("Should I should ask {b}{size=+10}what happened{/size}{/b}, what their future {b}{size=+10}plans{/size}{/b} are, or talk to {b}{size=+10}Liam{/size}{/b}.").strip().lower()

        if q_mom == "what happened":
            grace "We were just coming back from a trip when we heard about the bombs."
            grace "When we pulled up to our house... well, there was no house anymore."
            grace "It was gone."
            grace "And so we've just been walking around hoping to find... anything really."
     
        elif q_mom == "plans": 
            grace "We'll get back on the road tomorrow. Well, what's left of it anyways."
            grace "We really appreciate you letting us stay the night."
         
        elif q_mom =="liam": 
            george "So Liam,"
            $ ask_l = renpy.input("Ask Liam about his {b}{size=+10}teddy bear{/size}{/b} or his {b}{size=+10}age{/size}{/b}?")
            if ask_l == "teddy bear":
                george "Does your teddy bear have a name?"
                "Liam smiles."
                liam "Teddy."
                $ l += 1
            elif ask_l == "age":
                george "How old are you?"
                liam "I'm 10!"
                george "Oh wow, double digits! You know I have a son a few years older than you. I feel like you two would get along."
                "Grace smiles."
                $ g += 1
        else:
            "They didn't understand your question."
        menu:
            "Ask something else":
                pass  
            "Stop asking":
                call fire
                jump fire_mom

label fire_mom:
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





