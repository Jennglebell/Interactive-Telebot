def getWelcome(meal_options, restart=False):
    meal_options_string = __convertListToNumberedString(meal_options)

    if (restart):
        return (
            "You've chosen to restart! 😃\n\n"
            "🍽️ What would you like?\n"
            "{}".format(meal_options_string)
        )
    else:
        return (
            "Welcome to Subway! 😊\n\n"
            "🍽️ What kind of meal would you like?\n"
            "{}".format(meal_options_string)
        )


def getAskBreads(bread_options):
    return (
        "🍞 What bread you want?\n"
        "{}".format(__convertListToNumberedString(bread_options))
    )


def getAskMains(main_options):
    return (
        "🍖 What kind of mains you want?\n"
        "{}".format(__convertListToNumberedString(main_options))
    )


def getAskVeggies(veggie_options):
    return (
        "🥬 How about veggies?\n"
        "{}".format(__convertListToNumberedString(veggie_options))
    )


def getAskTopups(topup_options):
    return (
        "🧀 What topups would you like?\n"
        "{}".format(__convertListToNumberedString(topup_options))
    )


def getAskSauces(sauce_options):
    return (
        "🥣 Sauce?\n"
        "{}".format(__convertListToNumberedString(sauce_options))
    )


def getAskSides(side_options):
    return (
        "🍪 Almost done, pick your sides.\n"
        "{}".format(__convertListToNumberedString(side_options))
    )


def getAskDrinks(drink_options):
    return (
        "🥤 Last question, want drink what?\n"
        "{}".format(__convertListToNumberedString(drink_options))
    )


def getOrderSummary(meals, breads, mains, veggies, topups, sauces, sides, drinks):
    return (
        "Swee lah, come, I repeat your order\n\n"
        "<b>🍽️ Meal</b>\n"
        "{meals}\n"
        "<b>🍞 Bread</b>\n"
        "{breads}\n"
        "<b>🍖 Main</b>\n"
        "{mains}\n"
        "<b>🥬 Veggie</b>\n"
        "{veggies}\n"
        "<b>🧀 Topup</b>\n"
        "{topups}\n"
        "<b>🥣 Sauce</b>\n"
        "{sauces}\n"
        "<b>🍪 Side</b>\n"
        "{sides}\n"
        "<b>🥤 Drink</b>\n"
        "{drinks}\n"
        "Bye!"
    ).format(
        meals=__handleEmptyChoices(__convertListToNumberedString(meals)), 
        breads=__handleEmptyChoices(__convertListToNumberedString(breads)), 
        mains=__handleEmptyChoices(__convertListToNumberedString(mains)), 
        veggies=__handleEmptyChoices(__convertListToNumberedString(veggies)), 
        sauces=__handleEmptyChoices(__convertListToNumberedString(sauces)), 
        topups=__handleEmptyChoices(__convertListToNumberedString(topups)), 
        sides=__handleEmptyChoices(__convertListToNumberedString(sides)),
        drinks=__handleEmptyChoices(__convertListToNumberedString(drinks))
    )


def __convertListToNumberedString(list_input):
    string = ""
    for item in list_input:
        string += "• {item}\n".format(item=item.capitalize().replace("_", " "))
    return string
    

def __handleEmptyChoices(string_input):
    return "(Nothing selected)\n" if not string_input else string_input