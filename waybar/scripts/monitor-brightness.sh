#!/bin/sh

display="${DDC_DISPLAY:-1}"
step=5

cache_dir="${XDG_RUNTIME_DIR:-/tmp}"
cache_file="$cache_dir/waybar-ddc-brightness-${UID:-$(id -u)}"

read_brightness()
{
    line="$(
        ddcutil --display "$display" getvcp 10 --terse 2>/dev/null |
        awk '
            toupper($1) == "VCP" &&
            toupper($2) == "10" &&
            $3 == "C" {
                print $4, $5
                exit
            }
        '
    )"

    set -- $line

    if [ "$#" -eq 2 ] &&
       [ "$1" -ge 0 ] 2>/dev/null &&
       [ "$2" -gt 0 ] 2>/dev/null
    then
        current="$1"
        maximum="$2"

        percent=$(( (current * 100 + maximum / 2) / maximum ))

        printf '%s %s\n' "$percent" "$maximum" > "$cache_file"
        printf '%s %s\n' "$percent" "$maximum"
        return 0
    fi

    # Bei einem vorübergehenden DDC-Fehler den letzten gültigen Wert nutzen.
    if [ -r "$cache_file" ]; then
        cat "$cache_file"
        return 0
    fi

    return 1
}

set_brightness()
{
    target="$1"

    # Nicht bis 0 heruntergehen, damit der Monitor bedienbar bleibt.
    [ "$target" -lt 5 ] && target=5
    [ "$target" -gt 100 ] && target=100

    data="$(read_brightness)" || return 1
    set -- $data

    maximum="$2"
    raw_value=$(( (target * maximum + 50) / 100 ))

    # Ohne --noverify: ddcutil prüft, ob der Monitor den Wert übernommen hat.
    if ddcutil --display "$display" setvcp 10 "$raw_value" \
        >/dev/null 2>&1
    then
        printf '%s %s\n' "$target" "$maximum" > "$cache_file"

        # Waybar-Modul sofort aktualisieren.
        pkill -RTMIN+8 waybar 2>/dev/null || :
        return 0
    fi

    return 1
}

show_status()
{
    data="$(read_brightness)" || {
        printf '  --\n'
        return
    }

    set -- $data
    printf '  %s%%\n' "$1"
}

change_brightness()
{
    direction="$1"

    data="$(read_brightness)" || return 1
    set -- $data

    current="$1"

    case "$direction" in
        up)
            target=$((current + step))
            ;;
        down)
            target=$((current - step))
            ;;
        *)
            return 1
            ;;
    esac

    set_brightness "$target"
}

open_slider()
{
    data="$(read_brightness)" || return 1
    set -- $data

    current="$1"

    css='
window {
    background-color: #21162b;
    color: #f1dceb;
}

label {
    color: #f1dceb;
}

scale trough {
    min-height: 8px;
    background-color: #5b486c;
    border-radius: 8px;
}

scale highlight {
    background-color: #e89bc9;
    border-radius: 8px;
}

scale slider {
    min-width: 20px;
    min-height: 20px;
    background-color: #67cac6;
    border-radius: 10px;
}

button {
    background-color: #5b486c;
    color: #f1dceb;
    border-radius: 8px;
    padding: 6px 12px;
}

button:hover {
    background-color: #ad72c7;
}
'

    value="$(
        yad \
            --scale \
            --title="Bildschirmhelligkeit" \
            --text="Helligkeit des Philips-Monitors" \
            --value="$current" \
            --min-value=5 \
            --max-value=100 \
            --step="$step" \
            --enforce-step \
            --inc-buttons \
            --width=460 \
            --height=160 \
            --center \
            --on-top \
            --window-type=dialog \
            --button="Abbrechen":1 \
            --button="Anwenden":0 \
            --css="$css" \
            2>/dev/null
    )"

    result=$?
    [ "$result" -eq 0 ] || return 0

    # Je nach YAD-Version kann beispielsweise 55 oder 55.0 ausgegeben werden.
    value="${value%%.*}"

    case "$value" in
        ''|*[!0-9]*)
            return 1
            ;;
    esac

    set_brightness "$value"
}

case "${1:-status}" in
    status)
        show_status
        ;;
    up)
        change_brightness up
        ;;
    down)
        change_brightness down
        ;;
    popup)
        open_slider
        ;;
    *)
        printf 'Verwendung: %s {status|up|down|popup}\n' "$0" >&2
        exit 2
        ;;
esac
