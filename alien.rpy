define alien = Character("⩙⨶⩙", color="#40d9ad")
default a = 0
default shared = False
label intro_alien:
    $ current_visitor = "alien"
    "You hear scratching at your door."
    menu:
        "Let them in":
            jump ask_alien
        "Who are you?":
            "\"⧪⧬⫌⨬⩻⪊⧘⧘⧳⧿⩆⧢⩧⫙⧑⨮⧶⫈⩛⪌⫡\""
            menu:
                "Let them in":
                    jump ask_alien
                "Stay silent":
                    george "..."
                    "\"҂Ӿⱷ⟁.\""
                    george "..."
                    george "......."
                    "After several minutes you don't hear anything."
                    $ humanity -= 20
                    jump next_day
        "Stay silent":
            george "..."
            "\".....\""
            george "........."
            "\"................\""
            "After several minutes you don't hear anything."
            $ humanity -= 20
            jump next_day

label ask_alien:
    $ a += 2
    $ humanity += 10
    "You open the door to see a small creature with 3 eyes staring up at you."
    "Instinctly you scream and jump back."

    george "AHHHHH!!"

    "\"⫋⧘⨳⫶⩜⩗⩙⧮⫒⪛!!!!\""

    "The creature also looks scared."

    george "WHAT ARE YOU!?"

    "\"⧽⫖⪚⧛⩑⧊⫙⪀??\""

    "You start to catch whiff of all the toxins outside and while you're still scared, you quickly shoo the creature inside. "
    pause 3.0

    "You have absolutely no idea what to say to this thing."
    george "Uhh... hello."
    "The creature stares blankly with all 3 eyes."
    "You gesture at yourself."
    george "My name is George. Please don't eat me."
    "The creature doesn't even blink."

    "You go and sit at the table."
    "The creature goes and sits on the other seat."
    
    "The creature gestures to itself."

    alien "⩙⨶⩙"

    george "Ah.. yes."
    george "..."
    george "I see."
    pause 3.0

    while True:
        $ responses = ["⪅⧩⪇⧳⫇⨰⧘⫋⧷⧒⫞!", "⧌⧛⧷⫚⧡⧜⪝⧶⨽⩣⧫⫇⫁⪃⧞⩳⧽⫖⪚⧛⩑⧊⫙⪀⩛⧡⧎⪂⫅⫏⩿⧆⪉⩊⨻⧮⩘⩾⫓⪆⧯⧹⪓⨽⩨⧺⨪⫩⪀⩌⫝̸⧁⪋⩇",
                        "⧛⩻⪄⨽⧅⫗", "⫌⩤⧜⨴⫊⩠⧡⩘⧬⫏⨽⧞⫡⪅⩇⧖⫃", "⧒?", "⩽⫒⪓⧒⩔⫋"]
        $ q_tr = renpy.input("I have no idea what to say.\n").strip().lower()
        $ answer = renpy.random.choice(responses)
        alien "[response]"
        $ a += 1
        menu:
            "Ask something else???":
                pass  
            "Give up":
                "After attempting to make conversation with ... "
                "..."
                "You have no idea how to pronounce their name so you can't even say their name in your head."
                "After conversing with the creature you get up to grab some canned fruit."
                "The creature watches and gets excited when you open up the can."

                "Do you share your food?"
                menu:
                    "Yes":
                        $ shared = True
                        $ r += 3
                        $ humanity += 5
                        "You take some fruit out of the can and set it on the table in front of them."
                        "They happily gobble it up."
                        "You continue eating out of the can, putting some more on the table for them every once in a while."
                    "No":
                        $ r -= 2
                        $ humanity -= 3
                        "You shake your head no and make sure to keep the can close to your side of the table."
                        "The creature looks a bit sad as they look down at the floor."

                "As the day (night?) drags on, you notice the fire starting to dim in the furnance."
                "You look back at the creature and don't see anything they have that could help with the fire."
                jump fire_alien

                
label fire_alien:
    while dayItems < 2:
        if dayItems == 0:
            "You need to burn 2 items to keep the fire going."
        else: 
            "You still need to burn 1 more item."
        call inventory
        if shared:
            "You begin to look at your items when the creature comes over to the furnance."
            alien "⩅!⩅!⩅!⩅!"
            "The creature opens the door to the furnance."
            alien "⫳⧫⨞⧷⪄⫰⨶⧮⫦⧛⩒⩩⪈⨹⫣⧂⫟⩅⨥
                    ⧙⫬⩔⧌⧛⧷⫚⧡⧜⪝⧶⨽⩣⧫⫇⫁⪃⧞⩳
                    ⧽⫖⪚⧛⩑⧊⫙⪀⩛⧡⧎⪂⫅⫏⩿⧆⪉⩊⨻
                    ⧮⩘⩾⫓⪆⧯"
            "The creature chants something and then blows a blue flame out of its mouth into the furnance."
            "The flames in the furnance go blue for a just a second, and the fire grows hot with life."
            "The creature seems to look proud and jumps around before running to the beds."
            "You keep staring at the huge fire and the creature curled up at the end of your bed."
            "Eventually you shrug it off and walk over to the beds as well."
            "You lay down in the opposite bed of where the creature is sleeping."
            "But once you're tucked in the creature comes to join you at the base of your bed."
            "The creature curls up comfortably and falls asleep for the night."
            "And eventually,"
            "you do too."
            jump morning
        else:  
            jump burn_mine
            jump fire_robot
    
    "After a long day you "

label morning:
    

    


    


