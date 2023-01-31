PASSWORD=""

utf8_to_asci() {
    case "$1" in
    "!")
        PASSWORD+="%21"
        ;;
    "#")
        PASSWORD+="%23"
        ;;
    "$")
        PASSWORD+="%24"
        ;;
    "&")
        PASSWORD+="%26"
        ;;
    "'")
        PASSWORD+="%27"
        ;;
    "(")
        PASSWORD+="%28"
        ;;
    ")")
        PASSWORD+="%29"
        ;;
    "*")
        PASSWORD+="%2A"
        ;;
    "+")
        PASSWORD+="%2B"
        ;;
    ",")
        PASSWORD+="%2C"
        ;;
    "/")
        PASSWORD+="%2F"
        ;;
    ":")
        PASSWORD+="%3A"
        ;;
    ";")
        PASSWORD+="%3B"
        ;;
    "=")
        PASSWORD+="%3D"
        ;;
    "?")
        PASSWORD+="%3F"
        ;;
    "@")
        PASSWORD+="%40"
        ;;
    "[")
        PASSWORD+="%5B"
        ;;
    "]")
        PASSWORD+="%5D"
        ;;
    *)
        PASSWORD+="${1}"
        ;;
    esac
}

last=${#1}

for ((i = 0; i < $last; i++)); do
    utf8_to_asci ${1:i:1}
done


echo $PASSWORD

