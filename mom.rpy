define grace = Character("Grace", color="#fde560ff")
define liam = Character("Liam", color="#2CB1F8")

default g = 0
default l = 0
default burnedPhoto = False
default burnedBear = False
label intro_mom:
    $ current_visitor = "mom"
    "You hear a knock at the door followed by a smaller one."
    "\"Hello? Is anyone there?\""
    menu:
        "Let them in":
            jump ask_mom
        "Who are you?":
            "\"It's just me and my son passing through. It's getting rather late and we're looking for a place to spend the night.\""
            menu:
                "Let them in":
                    jump ask_mom
                "Stay silent":
                    "\"...\""
                    "\"Sorry for disturbing you sir. Come on Liam let's go.\""
                    $ humanity -= 20
                    jump next_day
        "Stay silent":
            george "..."
            "\"I don't think anyone is there Mom.\""
            "\"... I guess not Liam.\""
            $ humanity -= 20
            jump next_day

label ask_mom:
    $ g += 2
    $ l += 2
    "Thank you so much for letting us in, I can't tell you how much we appreciate it, right Liam?"

    liam "Yes, thank you sir."

    george "You're quite welcome little lad."

    liam "What's your name?"

    george "My name is George, and I take it your name is Liam?"

    liam "Yes, I'm Liam and this is my mom."

    grace "You can call me Grace."

    george "Grace. Wonderful to have you both. I don't have much down here but please, make yourselves comfortable."

    grace "Thank you, sitting by the fire is so nice after a long day of walking."

    pause 3.0

    "You feel like you should converse with your guests."
    while True:
        $ q_mom = renpy.input("Should I ask {b}{size=+10}what happened{/size}{/b}, what their future {b}{size=+10}plans{/size}{/b} are, or talk to {b}{size=+10}Liam{/size}{/b}.\n").strip().lower()

        if q_mom == "what happened":
            grace "We were just coming back from a trip when we heard about the bombs."
            grace "When we pulled up to our house... well, there was no house anymore."
            grace "It was gone."
            grace "And so we've just been walking around hoping to find... anything really, food, shelter, or anyone else alive."
            grace "For a second there I thought we were the only ones still alive in this town."
     
        elif q_mom == "plans": 
            grace "We'll get back on the road tomorrow. Well, what's left of it anyways."
            grace "We're hoping to reach the next town sooner or later."
            grace "We really appreciate you letting us stay the night."
         
        elif q_mom =="liam": 
            george "So Liam,"
            $ ask_l = renpy.input("Ask Liam about his {b}{size=+10}teddy bear{/size}{/b} or his {b}{size=+10}age{/size}{/b}?\n").strip().lower()
            if ask_l == "teddy bear":
                george "Does your teddy bear have a name?"
                "Liam smiles."
                liam "Teddy."
                $ l += 1
            elif ask_l == "age":
                george "How old are you?"
                liam "I'm 10!"
                george "Oh wow, double digits! You know I have a grandson about your age. I feel like you two would get along."
                "Grace smiles."
                $ g += 1
        else:
            "They didn't understand your question."
        menu:
            "Ask something else":
                pass  
            "Stop asking":
                "It was nice to see some normal people, just a mother with her son."
                "After your conversation with Grace and Liam you open up some cans of food and set them on the furnance top to try and heat them up."
                "You all end up eating room temperature food in comfortable silence and everything seems ok for the most part."
                "After a while you start to get goosebumps and look over to see the fire starting to die."
                george "Now I have to let you know. If that furnance goes out we'll be in big trouble."
                george "I don't intend on anyone dying tonight from the cold so I ask you to search yourself to see if there's anything you can add to keep the fire going."
                grace "Oh um.. we don't have much but let's see.."
                grace "The only thing in my purse are some photos..."
                "Grace starts to tear up."
                grace "I have some photos of our family before my husband passed away a year ago."
                "As Grace looks at the photo, Liam also looks around before his eyes land on the teddy bear in his hands."
                "He hesitates and looks a bit sad before stretching his arms out, presenting the teddy bear to you."
                grace "Oh Liam it shouldn't come to that"
                grace "... right?"
                jump fire_mom
                
label fire_mom:
    while dayItems < 2:
        if dayItems == 0:
            "You need to burn 2 items to keep the fire going."
        else: 
            "You need to burn 1 more item to keep the fire going."
        call inventory
        $ b_mom = renpy.input("Should I burn Grace's {b}{size=+10}photo{/size}{/b}, Liam's {b}{size=+10}teddy bear{/size}{/b}, or something of {b}{size=+10}mine{/size}{/b}?\n").strip().lower()
        if b_mom == "photo" and burnedPhoto == False:
            call burn_grace_photo
            "While you appreciate Grace's sacrifice, you realize it won't be enough to keep the fire going the entire night."
            "You need to burn something else."
        elif b_mom == "teddy bear" and burnedBear == False:
            call burn_teddy
            "While you appreciate Liam's sacrifice, you realize it won't be enough to keep the fire going the entire night."
            "You need to burn something else."
        elif b_mom == "mine":
            call burn_mine
        else:  
            "You can't burn that."
        jump fire_mom
        
    "After taking care of the fire we went over to the beds and laid down for the night."
    "Even if you feel uncertain about your choices. You know for certain you will live another day." 
    if burnedBear == True:
        "You wake up in the middle of the night to the sound of Liam crying." 
        "You shut your eyes trying to tell yourself that it had to be done."
    
   
    "You wake up to find Grace tying Liam's shoes."
    grace "Good morning George."
    george "Morning, are you both headed out already?"
    grace "Yes, we appreciate everything you've done for us but we've got to keep moving. Our plan is to keep walking to the next town in hopes of finding anything."
    george "I see. Well it was nice having you folks. Goodbye Liam."
    if burnedBear == True:
        "Liam refuses to look at you."
        if humanity > 30:
            george "I'm sorry about what happened to your bear."
            if hasWallet == True:
                "You take thirty dollars out of your wallet."
                george "Here, once you get to town take this and your next toy is on me ok?"
                "Liam smiles."
                liam "Mom look, I'm rich!"
                $ l += 2
                grace "Thank you George, that's the first time I've seen Liam smile in a while."
                $ g += 1
                liam "Goodbye sir."
    grace "Goodbye George, I wish you well."
    george "Same goes for you, safe travels."
    "Grace and Liam put their gas masks back on and head out."
    "You head back over to your chair and think about the day ahead of you."
    "You're eating some cold soup when suddenly you hear something."
    jump choose_visitor
       
label burn_grace_photo:
    $ dayItems += 1
    $ burnedPhoto = True
    grace "I understand."
    "Grace sadly stares at the last photos of her family all togehter, making sure to memorize every detail of her husband."
    "After a few moments and a deep breath, Grace sets the photos into the furnance."
    "The fire quickly eats up the photos, melting the faces together."
    $ g -= 2
    $ humanity -= 5
    jump fire_mom

label burn_teddy:
    $ dayItems += 1
    $ burnedBear = True
    "Liam instantly clutches his teddy bear tight against his chest as you reach for it."
    "You can tell he's upset at the thought of losing his favorite stuffed animal."
    "You reach your hand out towards Liam and after a few minutes Liam slowly hands you his teddy bear."
    "You toss it in the fire, and watch as Liam's tears run down his cheeks."
    $ l -= 4
    $ humanity -= 5
    jump fire_mom
    


    


