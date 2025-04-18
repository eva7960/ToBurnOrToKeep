# Declare characters
define george = Character("George", color="#5A9E32")
default hasPhoto = True
default hasDrawing = True
default hasWallet = True
default hasNothing = False

# Default values
default humanity = 100
default current_visitor = "none"
default day = 0
default dayItems = 0


label start:



    # "I ran as soon as I heard the sirens."

    # "Mary!"

    # "John!"

    # "I ran to the driveway and looked down the road for any signs of our car."

    # "Nothing."

    # "The sirens were still wailing and I knew the bomb would hit at any moment."

    # "Please please let them be ok."

    # "I took out my phone and dialed my wife's number."

    # "Nothing."

    # "So I sent a text: \"Please get back safe\"."

    # "My hands started to shake."

    # "\"And whatever happens, just know I love you and John with all my heart.\""

    # "I held back tears as I ran to the fallout shelter."

    # "I left the doors open just in case and started to light the furnace."

    # "The sirens were loud and I knew the bomb would probably hit any second."

    # "I had no choice but to grab and lock the doors for my own safety."

    # "I checked my phone again."

    # "Nothing."

    # scene bg main with fade

    # george "I continued to check my phone and every time—"

    # george "Nothing."

    # george "The stress was overwhelming and I don't know when, but I fell asleep."

    # scene black with fade

    # pause 5

    # scene bg main

    # george "I woke up and ran for the doors— that must be Mary and John!"

    # scene black
    # "Hello?"

    george "..."

    george "That's not her."

    jump fire_robot


# Inventory system
label inventory:
    $ items = []

    if hasPhoto:
        $ items.append("a photo of your family")
    if hasDrawing:
        $ items.append("a child's drawing")
    if hasWallet:
        $ items.append("your wallet")

    if len(items) > 1:
        $ combined = ", ".join(items[:-1])
        $ formatted = f"In your own pockets you have {combined}, and {items[-1]}."
    elif len(items) == 1:
        $ formatted = f"In your own pockets you have {items[0]}."
    else:
        $ formatted = "You don't have any more items to burn."

    george "[formatted]"

    return

label burn_mine:
    $ inv_mom = renpy.input("Should I burn my {b}{size=+10}photo{/size}{/b}, John's birthday {b}{size=+10}card{/size}{/b}, or my {b}{size=+10}wallet{/size}{/b}?\n")
    if not (hasPhoto or hasDrawing or hasWallet):
        "You have nothing left to burn."
        $ hasNothing = True
    if inv_mom == "photo" and hasPhoto:
        $ dayItems += 1
        $ hasPhoto = False
        "You toss the photo of you and your wife into the furnance."
        "You feel your heart sink as you see your faces disappear in the flames."
    elif inv_mom == "card" and hasDrawing:
        $ dayItems += 1
        $ hasDrawing = False
        "You look at the birthday card your grandson gave you yesterday."
        "You think about how this might've been the last one you ever receive from him."
        "You hold back tears as you set the card in the fire."
    elif inv_mom == "wallet" and hasWallet:
        $ dayItems += 1
        $ hasWallet = False
        "You take your wallet out of your pocket and pull out a wrinkled five dollar bill."
        george "I guess I won't be needing this any time soon."
        "You toss a few small bills into the fire."
        "The flames quickly engulf the money and you end up donating your entire wallet to the cause."
    else: 
        "You already burned that."
    return

label choose_visitor:
    "Choose visitor."

label next_day:
    if current_visitor == "none":
        "You decide to not let them in and sit safely in your shelter."
        #fade
        "As time passes, you start to grow cold."
        "You look over and notice the fire is dying."
        "You need to add more fuel to keep it alive or else you may be the next one to die."
        jump burn_mine
        if hasNothing:
            jump end
    $ day += 1
    $ dayItems = 0
    $ current_visitor = "none"

label end:
    "You've reached the end."
