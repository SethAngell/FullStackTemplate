#!/usr/bin/env python3


class color:
    PURPLE = "\033[95m"
    CYAN = "\033[96m"
    DARK_CYAN = "\033[36m"
    BLUE = "\033[94m"
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    RED = "\033[91m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"
    END = "\033[0m"


class emoji:
    moon = "\U0001F315"
    rocket = "\U0001F680"
    stars = "\U00002728"
    smile = "\U0001F604"
    wave = "\U0001F44B"
    construction_fence = "\U0001F6A7"
    construction_worker = "\U0001F477"


name_update_locations = {
    "snake-case": [
        "docker-compose.yml",
    ],
    "api_name": [
        "./backend/start.sh",
    ],
}


def generate_rich(text, bold=False, selected_color=None):
    if selected_color != None:
        if bold:
            return f"{color.BOLD}{selected_color}{text}{color.END}"
        else:
            return f"{selected_color}{text}{color.END}"
    else:
        if bold:
            return f"{color.BOLD}{text}{color.END}"
        else:
            return f"{text}"


print(
    generate_rich(
        f"{emoji.moon}{emoji.rocket}{emoji.stars} Welcome! Let's set up your repo! {emoji.stars}{emoji.rocket}{emoji.moon}",
        True,
        color.BLUE,
    )
)

display_name = input("What name will you be giving your project: ")
underscore_name = display_name.replace(" ", "_").lower()
docker_name = display_name.replace(" ", "-").lower()

print("\nAwesome! These are the names we'll use: ")
print(f"Display Name:     {generate_rich(display_name, True, color.BLUE)}")
print(f"API Name:         {generate_rich(underscore_name, True, color.BLUE)}")
print(f"Snake Case Name:  {generate_rich(docker_name, True, color.BLUE)}")

print(
    generate_rich(
        f"\n{emoji.construction_fence}{emoji.construction_worker} One moment, personalizing your project... {emoji.construction_worker}{emoji.construction_fence}",
        True,
        color.BLUE,
    )
)

for file_path in name_update_locations["api_name"]:
    content = ""
    with open(file_path, "r") as ifile:
        content = ifile.read()

    content.replace("{PROJECT_NAME}", underscore_name)

    with open(file_path, "w") as ofile:
        ofile.write(content)


for file_path in name_update_locations["snake-case"]:
    content = ""
    with open(file_path, "r") as ifile:
        content = ifile.read()

    content.replace("{PROJECT_NAME}", docker_name)

    with open(file_path, "w") as ofile:
        ofile.write(content)
