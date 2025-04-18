define tr = Character("TR-87", color="#832626")
default name = "TR-87"
default isTR = True
default r = 0
default left = False
label intro_robot:
    $ current_visitor = "robot"
    "You hear metal thuds against your door."
    "You scramble under the table."
    "\"Scanning.\""
    menu:
        "Let them in":
            jump ask_robot
        "Who are you?":
            "\"Hello George. I am model TR-87.\""
            menu:
                "Let them in":
                    jump ask_robot
                "Stay silent":
                    george "..."
                    "\"I know you are in there George.\""
                    george "..."
                    "\"Coward detected.\""
                    "You hear metal sounds getting further away."
                    $ humanity -= 20
                    jump next_day
        "Stay silent":
            george "..."
            "\"I know you are in there George.\""
            george "..."
            "\"Coward detected.\""
            "You hear metal sounds getting further away."
            $ humanity -= 20
            jump next_day

label ask_robot:
    $ r += 2
    $ humanity += 10
    "You open the door to see a metal robot standing in the doorway with a folder in its hand."
    "It's missing an arm."
    "The robot steps inside and you close the door behind it."

    george "...can I help you?"

    tr "Hello George. Can you tell me where the nearest facility is?"

    george "Facility?"
    george "...like a bathroom?"
    george "..."
    george "Can you even use those?"

    george "And how do you know my name?"

    tr "I know every resident in this town and I am in search of the nearest GenCore Reserach Laboratory."
    tr "..not a bathroom."

    george "Apologies yes of course I absolutely know what that is and did not think a robot as fine as yourself was asking for such services."

    tr "..."

    george "..."
    george "But anyway, I've never heard of this place in my life and I doubt it's still around after that bomb dropped."

    tr "I see"

    george "..."

    tr "..." 

    george "Well no need to stand there, you're welcome to take a seat."
    
    pause 3.0

    "Well this is awkward."
    "You feel like you should converse with your guest."
    "...even if they aren't human."
    
    pause 3.0

    while True:
        $ q_tr = renpy.input("Should I ask about {b}{size=+10}what happened{/size}{/b}, their {b}{size=+10}name{/size}{/b}, or about the {b}{size=+10}folder{/size}{/b} they're holding.\n").strip().lower()
        if q_tr== "what happened":
            george "So what happened to you? How did you survive the bomb?"
            if isTR:
                tr "I am part of the GenCore Research Laboratory."
                tr "My memory only recalls booting up and seeing walls and rubbish everywhere."
                tr "I scanned for survivors and the results were 0."
                tr "I emerged from the building remains and have been walking and scanning for lifeforms."
                tr "It has been 9 days, 18 hours, 231 minutes and I need to find a charge pod."
            else:
                tr2 "I am part of the GenCore Research Laboratory."
                tr2 "My memory only recalls booting up and seeing walls and rubbish everywhere."
                tr2 "I scanned for survivors and the results were zero."
                tr2 "I emerged from the building remains and have been walking and scanning for lifeforms."
                tr2 "It has been 9 days, 18 hours, 231 minutes and I need to find a charge pod."

            george "How long do you have until your battery dies?" 
            if isTR:
                tr "I will shut down on day 15."
            else: 
                tr2 "I will shut down on day 15."
            george "Oh..."
     
        elif q_tr == "name" and isTR: 
            george "How did you get your name?"
            tr "It is my model number."
            george "Do you ever think of changing it?"
            tr "... sometimes."
            george "What would you change it to?"
            tr "I do not know."
            george "Hmm... what if I gave you a name?"
            tr "What name would you give me?"
            $ newName = renpy.input("What name would suit TR-87?\n").strip().lower()
            if newName == "tr-87" or newName == "tr87":
                tr "You think my name suits me?"
                tr "Thank you"
                "TR-87 seems content."
            else:
                $ name = newName
                george "What about [name]?"
                tr "[name]?"
                tr "..."
                tr "I think I like that."
                "[name] seems happy about their new name."
                $ isTR = False
                $ tr2 = Character(name, color="#832626")
            $ r += 3
        
        elif q_tr == "name" and isTR == False:
            "[name] is happy with their new name."
            
        elif q_tr =="folder": 
            george "What's that folder you got there?"

            if isTR:
                tr "When I booted up I went to the officers' office."
                tr "No one was there."
                tr "I found on a folder on the ground with my name."
                tr "I have a whole database of information on other people."
                tr "But this is the only information I have of myself."
                tr "This contains the instructions to build more models like me."
                tr "I now know when I was created, by who, what my purpose is, the trial and error of making me, everything."
            else:
                tr2 "When I booted up I went to the officers' office."
                tr2 "No one was there."
                tr2 "I found on a folder on the ground with my name."
                tr2 "I have a whole database of information on other people."
                tr2 "But this is the only information I have of myself."
                tr2 "This contains the instructions to build more models like me."
                tr2 "I now know when I was created, by who, what my purpose is, the trial and error of making me, everything."
            george "What do you do?"

            if isTR:
                tr "I was a trial of a military robot."
                tr "They were in the process of adding a weapon modification to my arm but I must have lost my arm when the bomb dropped."
                tr "However, my system state is more balanced now that my arm is gone."
            else:
                tr2 "I was a trial of a military robot."
                tr2 "They were in the process of adding a weapon modification to my arm but I must have lost my arm when the bomb dropped."
                tr2 "However, my system state is more balanced now that my arm is gone."

            george "Funny, you'd think it would be the opposite and your system would start freaking out."

            if isTR:
                tr "I cannot hurt people now."
                tr "That makes me..."
                tr "My system state feels stablized."
            else: 
                tr2 "I cannot hurt people now."
                tr2 "That makes me..."
                tr2 "My system state feels stablized."
            $ r += 1
        else:
            "They didn't understand your question."
        menu:
            "Ask something else":
                pass  
            "Stop asking":
                "After conversing with [name] the tension and awkwardness begins to fade."
                "Time passes as you relax and eat some canned food."
                "[name] spends their time flipping through the documents for the hundredth time."
                "They seem full of hope, like they've just started a new chapter."
                "As the hours pass, you suddenly realize the fire is starting to dim again."
                george "Hey [name].."
                george "I know you're a robot so this doesn't exactly apply to you but if that fire over there goes out there's a good chance I won't wake up tomorrow morning."

                jump fire_robot

                
label fire_robot:
    while dayItems < 2:
        if dayItems == 0:
            "You need to burn 2 items to keep the fire going."
        else: 
            "Even after that crazy experience, you still need to burn 1 more item."
        call inventory
        $ b_tr = renpy.input("Should I burn [name]'s {color=#ff0000}{b}{size=+10}documents{/size}{/b}{/color} or " +
        "something of {color=#ff0000}{b}{size=+10}mine{/size}{/b}{/color}?\n").strip().lower()
        if b_tr == "documents" or b_tr == "document":
            $ dayItems += 1
            george "[name], your papers would definitely help keep the fire going."
            if r > 4 and humanity > 60:
                george "I know it's a lot to ask but please, would you be willing to burn your papers for me."
                tr2 "..."
                tr2 "I"
                tr2 "..."
                tr2 "Yes George."
                tr2 "After interacting with you, my system state has never been so stablized."
                tr2 "I like the name you've given me. I feel... different."
                tr2 "You have made me a new robot and I do not need to rely on these papers to tell me who I am."
                "[name] gets up and tosses the papers happily into the fire."
                "[name] heads toward the door."
                tr2 "I do not have much time left, I need to find a charging pod so that I can do all that I desire."
                tr2 "Thank you George. I will not forget you."
                tr2 "I hope you do what makes you..."
                tr2 "What makes your system state stablized."
                "[name] bids you farewell and leaves."
                "You sit there relieved and happy with how that went."
                $ dayItems += 1
                $ humanity += 5
                $ r += 2
                $ left = True
                jump fire_robot
            else:
                george "I need you to put your papers in the fire"
                tr "No. I will not do that." 
                george "I let you in. The least you could do is help keep me alive by putting something in the fire."
                tr "No. I will not sacrifice my only source of identification."

                "You stand up and walk over to [name]."
                "The robot clutches the papers with their one arm."
                "You try to pry the papers away, making the robot feel threatened."
                "[name] slams their metal arm down onto your hand making you scream and let go."
                "[name] dashes toward the door and escapes into the night."
                "You stand stunned trying to understand what just happened."
                $ left = True
                $ humanity -= 5
        elif b_tr == "mine":
            call burn_mine
        else:  
            "You can't burn that."
        jump fire_robot
        
    "After such an emotional night you head to bed, tired."
    "Even if you feel uncertain about your choices. You know for certain you will live another day." 
    if left == False:
        "You wake up in the morning to find [name] gone and a small piece of paper on the table."
        "The note reads: \"Thank you everything George. You have helped me realize I am more than what this paper says I am.\""
        "\"I had to leave as I must find a charging pod so that I can accomplish all the things that I want.\""
        "\"Best of luck George. -[name]\""
        "You flip the note around to realize it's a torn piece of one of the document papers."
        "You smile and start your day by cracking open a bottle of water."
        "You grab a can of food and are just about to start eating it when..."
        jump choose_visitor
    else:
        "The next day you wake up and after eating some breakfast you begin reflecting on last night."
        "When suddenly..."
        jump choose_visitor
    


    


