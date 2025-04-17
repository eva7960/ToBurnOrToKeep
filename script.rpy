# Declare characters
define george = Character("George", color="#5A9E32")
default hasPhoto = True
default hasCard = True
default hasWallet = True
define grace = Character("Grace", color="#fde560ff")
define liam = Character("Liam", color="#2CB1F8")

default g = 0
default l = 0

# Default values
default humanity = 100
default current_visitor = "none"
default day = 0


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

    jump intro_mom


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
        $ formatted = f"You have {combined} and {items[-1]}."
    elif len(items) == 1:
        $ formatted = f"You have {items[0]}."
    else:
        $ formatted = "You don't have any more items to burn."

    "[formatted]"

    return

label fire:
    george "Now I have to let you know. If that furnance goes out we'll be in big trouble."
    george "I don't intend on anyone dying tonight from the cold so I ask you to search yourself to see if there's anything you can add to keep the fire going."
    return

label burn_mine:
     $ inv_mom = renpy.input("Should I burn my {b}{size=+10}photo{/size}{/b}, John's birthday {b}{size=+10}card{/size}{/b}, or my {b}{size=+10}wallet{/size}{/b}?")
        if inv_mom == "photo" and hasPhoto:
            $ hasPhoto = False
            "You toss the photo of your family into the furnance."
            "You feel your heart sink as you see Mary and John's face disappear in the flames."
        elif inv_mom == "card" and hasDrawing:
            "You look at the birthday card John gave you yesterday."
            "You think about how this might've been the last one you ever receive from him."
            "You hold back tears as you set the card in the fire."
        elif inv_mom == "wallet" and hasWallet:
            "You take your wallet out of your pocket and pull out a wrinkled five dollar bill."
            george "I guess I won't be needing this any time soon."
            "You toss a few small bills into the fire."
            "The flames quickly engulf the money and you end up donating your entire wallet to the cause."
        else: 
            "You don't have any more stuff to burn."

label next_day:
    "next day"



